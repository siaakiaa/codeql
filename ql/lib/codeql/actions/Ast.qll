private import codeql.actions.ast.internal.Yaml
private import codeql.Locations

/**
 * Base class for the AST tree. Based on YamlNode from the Yaml library.
 */
class AstNode instanceof YamlNode {
  AstNode getParentNode() { result = super.getParentNode() }

  AstNode getAChildNode() { result = super.getAChildNode() }

  string toString() { result = super.toString() }

  string getAPrimaryQlClass() { result = super.getAPrimaryQlClass() }

  Location getLocation() { result = super.getLocation() }

  /**
   * Gets the enclosing workflow statement.
   */
  Workflow getEnclosingWorkflow() { this = result.getAChildNode*() }

  /**
   * Gets a environment variable expression by name in the scope of the current node.
   */
  StringLiteral getEnvVar(string name) {
    exists(Env env | env.(YamlMapping).maps(any(YamlScalar s | s.getValue() = name), result) |
      env.(StepEnv).getStep().getAChildNode*() = this
      or
      env.(JobEnv).getJob().getAChildNode*() = this
      or
      env.(WorkflowEnv).getWorkflow().getAChildNode*() = this
    )
  }
}

/** A common class for `env` in workflow, job or step. */
abstract class Env extends AstNode instanceof YamlMapping { }

/** A workflow level `env` mapping. */
class WorkflowEnv extends Env {
  Workflow workflow;

  WorkflowEnv() { workflow.(YamlMapping).lookup("env") = this }

  /** Gets the workflow this field belongs to. */
  Workflow getWorkflow() { result = workflow }
}

/** A job level `env` mapping. */
class JobEnv extends Env {
  Job job;

  JobEnv() { job.(YamlMapping).lookup("env") = this }

  /** Gets the job this field belongs to. */
  Job getJob() { result = job }
}

/** A step level `env` mapping. */
class StepEnv extends Env {
  Step step;

  StepEnv() { step.(YamlMapping).lookup("env") = this }

  /** Gets the step this field belongs to. */
  Step getStep() { result = step }
}

/**
 * A custom composite action. This is a mapping at the top level of an Actions YAML action file.
 * See https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions.
 */
class CompositeAction extends AstNode instanceof YamlDocument, YamlMapping {
  //class CompositeAction extends AstNode, YamlDocument, YamlMapping {
  CompositeAction() {
    this.getFile().getBaseName() = ["action.yml", "action.yaml"] and
    super.lookup("runs").(YamlMapping).lookup("using").(YamlScalar).getValue() = "composite"
  }

  /** Gets the `runs` mapping. */
  Runs getRuns() { result = super.lookup("runs") }

  Outputs getOutputs() { result = super.lookup("outputs") }

  StringLiteral getAnOutput() { result = this.getOutputs().getAnOutput() }

  StringLiteral getOutput(string name) { result = this.getOutputs().getOutput(name) }

  Input getAnInput() { super.lookup("inputs").(YamlMapping).maps(result, _) }

  Input getInput(string name) {
    super.lookup("inputs").(YamlMapping).maps(result, _) and
    result.(YamlString).getValue() = name
  }
}

/**
 * An `runs` mapping in a custom composite action YAML.
 * See https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#runs
 */
class Runs extends AstNode instanceof YamlMapping {
  CompositeAction action;

  Runs() { action.(YamlMapping).lookup("runs") = this }

  /** Gets the action that this `runs` mapping is in. */
  CompositeAction getAction() { result = action }

  /** Gets any steps that are defined within this job. */
  Step getAStep() { result = super.lookup("steps").(YamlSequence).getElementNode(_) }

  /** Gets the step at the given index within this job. */
  Step getStep(int i) { result = super.lookup("steps").(YamlSequence).getElementNode(i) }
}

/**
 * An Actions workflow. This is a mapping at the top level of an Actions YAML workflow file.
 * See https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions.
 */
class Workflow extends AstNode instanceof YamlDocument, YamlMapping {
  /** Gets the `jobs` mapping from job IDs to job definitions in this workflow. */
  YamlMapping getJobs() { result = super.lookup("jobs") }

  /** Gets the 'global' `env` mapping in this workflow. */
  WorkflowEnv getEnv() { result = super.lookup("env") }

  /** Gets the name of the workflow. */
  string getName() { result = super.lookup("name").(YamlString).getValue() }

  /** Gets the job within this workflow with the given job ID. */
  Job getJob(string jobId) { result.getWorkflow() = this and result.getId() = jobId }

  /** Gets a job within this workflow */
  Job getAJob() { result = this.getJob(_) }

  predicate hasTriggerEvent(string trigger) {
    exists(YamlNode n | n = super.lookup("on").(YamlMappingLikeNode).getNode(trigger))
  }

  string getATriggerEvent() {
    exists(YamlNode n | n = super.lookup("on").(YamlMappingLikeNode).getNode(result))
  }

  Permissions getPermissions() { result = super.lookup("permissions") }

  Strategy getStrategy() { result = super.lookup("strategy") }
}

class ReusableWorkflow extends Workflow instanceof YamlMapping {
  YamlValue workflow_call;

  ReusableWorkflow() {
    super.lookup("on").(YamlMappingLikeNode).getNode("workflow_call") = workflow_call
  }

  Outputs getOutputs() { result = workflow_call.(YamlMapping).lookup("outputs") }

  StringLiteral getAnOutput() { result = this.getOutputs().getAnOutput() }

  StringLiteral getOutput(string name) { result = this.getOutputs().getOutput(name) }

  Input getAnInput() { workflow_call.(YamlMapping).lookup("inputs").(YamlMapping).maps(result, _) }

  Input getInput(string name) {
    workflow_call.(YamlMapping).lookup("inputs").(YamlMapping).maps(result, _) and
    result.(YamlString).getValue() = name
  }
}

class Input extends AstNode {
  YamlMapping parent;

  Input() { parent.lookup("inputs").(YamlMapping).maps(this, _) }
}

class Outputs extends AstNode instanceof YamlMapping {
  YamlMapping parent;

  Outputs() { parent.lookup("outputs") = this }

  /**
   * Gets an output expression.
   */
  StringLiteral getAnOutput() {
    super.lookup(_).(YamlMapping).lookup("value") = result or
    super.lookup(_) = result
  }

  /**
   * Gets a specific output expression by name.
   */
  StringLiteral getOutput(string name) {
    super.lookup(name).(YamlMapping).lookup("value") = result or
    super.lookup(name) = result
  }

  string getAnOutputName() { this.(YamlMapping).maps(any(YamlString s | s.getValue() = result), _) }

  override string toString() { result = "Job outputs node" }
}

class Permissions extends AstNode instanceof YamlMapping {
  YamlMapping parent;

  Permissions() { parent.lookup("permissions") = this }
}

class Strategy extends AstNode instanceof YamlMapping {
  YamlMapping parent;

  Strategy() { parent.lookup("strategy") = this }

  /**
   * Gets a specific matric expression (YamlMapping) by name.
   */
  StringLiteral getMatrixVariable(string name) {
    super.lookup("matrix").(YamlMapping).lookup(name) = result
  }

  string getAMatrixVariableName() {
    this.(YamlMapping).maps(any(YamlString s | s.getValue() = result), _)
  }
}

/**
 * https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idneeds
 */
class Needs extends AstNode {
  Job job;

  Needs() { job.(YamlMapping).lookup("needs") = this }

  Job getJob() { result = job }

  Job getANeededJob() {
    if this instanceof YamlString
    then
      result.getId() = this.(YamlString).getValue() and
      result.getLocation().getFile() = job.getLocation().getFile()
    else
      if this instanceof YamlSequence
      then
        result.getId() = this.(YamlSequence).getElementNode(_).(YamlString).getValue() and
        result.getLocation().getFile() = job.getLocation().getFile()
      else none()
  }
}

/**
 * An Actions job within a workflow.
 * See https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobs.
 */
class Job extends AstNode instanceof YamlMapping {
  string jobId;
  Workflow workflow;

  Job() { this = workflow.getJobs().lookup(jobId) }

  /**
   * Gets the ID of this job, as a string.
   * This is the job's key within the `jobs` mapping.
   */
  string getId() { result = jobId }

  /** Gets any steps that are defined within this job. */
  Step getAStep() { result = super.lookup("steps").(YamlSequence).getElementNode(_) }

  /** Gets the step at the given index within this job. */
  Step getStep(int i) { result = super.lookup("steps").(YamlSequence).getElementNode(i) }

  /** Gets the workflow this job belongs to. */
  Workflow getWorkflow() { result = workflow }

  /**
   * Gets a needed job.
   * eg:
   *     - needs: [job1, job2]
   */
  Job getANeededJob() {
    exists(Needs needs |
      needs.getJob() = this and
      result = needs.getANeededJob()
    )
  }

  /**
   * Gets the declaration of the outputs for the job.
   * eg:
   *   out1: ${steps.foo.bar}
   *   out2: ${steps.foo.baz}
   */
  Outputs getOutputs() { result = super.lookup("outputs") }

  StringLiteral getAnOutput() { result = this.getOutputs().getAnOutput() }

  StringLiteral getOutput(string name) { result = this.getOutputs().getOutput(name) }

  /**
   * Reusable workflow jobs may have Uses children
   * eg:
   * call-job:
   *   uses: ./.github/workflows/reusable_workflow.yml
   *   with:
   *     arg1: value1
   */
  UsesJob getUses() { result.getJob() = this }

  predicate usesReusableWorkflow() {
    this.(YamlMapping).maps(any(YamlString s | s.getValue() = "uses"), _)
  }

  If getIf() { result = super.lookup("if") }

  Permissions getPermissions() { result = super.lookup("permissions") }

  Strategy getStrategy() { result = super.lookup("strategy") }

  override string toString() { result = "Job: " + jobId }
}

/**
 * A step within an Actions job.
 * See https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idsteps.
 */
class Step extends AstNode instanceof YamlMapping {
  YamlMapping parent;

  Step() { parent.lookup("steps").(YamlSequence).getElementNode(_) = this }

  /** Gets the ID of this step, if any. */
  string getId() { result = super.lookup("id").(YamlString).getValue() }

  /** Gets the `job` this step belongs to, if the step belongs to a `job` in a workflow. Has no result if the step belongs to `runs` in a custom composite action. */
  Job getJob() { result = parent }

  /** Gets the value of the `if` field in this step, if any. */
  If getIf() { result = super.lookup("if") }
}

/**
 * An If node representing a conditional statement.
 */
class If extends AstNode {
  YamlMapping parent;

  If() {
    (parent instanceof Step or parent instanceof Job) and
    parent.lookup("if") = this
  }

  AstNode getEnclosingNode() { result = parent }

  string getCondition() { result = this.(YamlScalar).getValue() }
}

/**
 * Abstract class representing a call to a 3rd party action or reusable workflow.
 */
abstract class Uses extends AstNode {
  abstract string getCallee();

  abstract string getVersion();

  abstract StringLiteral getArgument(string key);

  override string toString() { result = "Uses Step" }
}

/**
 * Gets a regular expression that parses an `owner/repo@version` reference within a `uses` field in an Actions job step.
 * The capture groups are:
 * 1: The owner of the repository where the Action comes from, e.g. `actions` in `actions/checkout@v2`
 * 2: The name of the repository where the Action comes from, e.g. `checkout` in `actions/checkout@v2`.
 * 3: The version reference used when checking out the Action, e.g. `v2` in `actions/checkout@v2`.
 */
private string usesParser() { result = "([^/]+)/([^/@]+)@(.+)" }

/**
 * A Uses step represents a call to an action that is defined in a GitHub repository.
 */
class UsesStep extends Step, Uses {
  YamlScalar uses;

  UsesStep() { this.(YamlMapping).maps(any(YamlScalar s | s.getValue() = "uses"), uses) }

  /** Gets the owner and name of the repository where the Action comes from, e.g. `actions/checkout` in `actions/checkout@v2`. */
  override string getCallee() {
    result =
      (
        uses.getValue().regexpCapture(usesParser(), 1) + "/" +
          uses.getValue().regexpCapture(usesParser(), 2)
      ).toLowerCase()
  }

  /** Gets the version reference used when checking out the Action, e.g. `v2` in `actions/checkout@v2`. */
  override string getVersion() { result = uses.getValue().regexpCapture(usesParser(), 3) }

  override StringLiteral getArgument(string key) {
    result = this.(YamlMapping).lookup("with").(YamlMapping).lookup(key)
  }

  override string toString() {
    if exists(this.getId()) then result = "Uses Step: " + this.getId() else result = "Uses Step"
  }
}

/**
 * A Uses step represents a call to an action that is defined in a GitHub repository.
 */
class UsesJob extends Uses instanceof YamlMapping {
  UsesJob() { this instanceof Job and this.maps(any(YamlString s | s.getValue() = "uses"), _) }

  Job getJob() { result = this }

  /**
   * Gets a regular expression that parses an `owner/repo@version` reference within a `uses` field in an Actions job step.
   * local repo: octo-org/this-repo/.github/workflows/workflow-1.yml@172239021f7ba04fe7327647b213799853a9eb89
   * local repo: ./.github/workflows/workflow-2.yml
   * remote repo: octo-org/another-repo/.github/workflows/workflow.yml@v1
   */
  private string repoUsesParser() { result = "([^/]+)/([^/]+)/([^@]+)@(.+)" }

  private string pathUsesParser() { result = "\\./(.+)" }

  override string getCallee() {
    exists(YamlString name |
      super.lookup("uses") = name and
      if name.getValue().matches("./%")
      then result = name.getValue().regexpCapture(this.pathUsesParser(), 1)
      else
        result =
          name.getValue().regexpCapture(this.repoUsesParser(), 1) + "/" +
            name.getValue().regexpCapture(this.repoUsesParser(), 2) + "/" +
            name.getValue().regexpCapture(this.repoUsesParser(), 3)
    )
  }

  /** Gets the version reference used when checking out the Action, e.g. `v2` in `actions/checkout@v2`. */
  override string getVersion() {
    exists(YamlString name |
      super.lookup("uses") = name and
      if not name.getValue().matches("\\.%")
      then result = name.getValue().regexpCapture(this.repoUsesParser(), 4)
      else none()
    )
  }

  override StringLiteral getArgument(string key) {
    super.lookup("with").(YamlMapping).lookup(key) = result
  }
}

/**
 * A `run` field within an Actions job step, which runs command-line programs using an operating system shell.
 * See https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepsrun.
 */
class Run extends Step {
  StringLiteral script;

  Run() { this.(YamlMapping).maps(any(YamlString s | s.getValue() = "run"), script) }

  StringLiteral getScript() { result = script }

  override string toString() {
    if exists(this.getId()) then result = "Run Step: " + this.getId() else result = "Run Step"
  }
}

/**
 * A YamlString part of a YamlSequence or YamlMapping values.
 */
class StringLiteral extends AstNode instanceof YamlString {
  StringLiteral() {
    exists(YamlCollection c |
      c instanceof YamlMapping and
      c.(YamlMapping).maps(_, this)
      or
      c instanceof YamlSequence and
      c.(YamlSequence).getElementNode(_) = this
    )
  }

  string getValue() { result = this.(YamlString).getValue() }
}

/**
 * Holds if `${{ e }}` is a GitHub Actions expression evaluated within this YAML string.
 * See https://docs.github.com/en/free-pro-team@latest/actions/reference/context-and-expression-syntax-for-github-actions.
 * Only finds simple expressions like `${{ github.event.comment.body }}`, where the expression contains only alphanumeric characters, underscores, dots, or dashes.
 * Does not identify more complicated expressions like `${{ fromJSON(env.time) }}`, or ${{ format('{{Hello {0}!}}', github.event.head_commit.author.name) }}
 */
string getASimpleReferenceExpression(YamlString node) {
  // We use `regexpFind` to obtain *all* matches of `${{...}}`,
  // not just the last (greedy match) or first (reluctant match).
  result =
    node.getValue()
        .regexpFind("\\$\\{\\{\\s*[A-Za-z0-9_\\[\\]\\*\\(\\)\\.\\-]+\\s*\\}\\}", _, _)
        .regexpCapture("\\$\\{\\{\\s*([A-Za-z0-9_\\[\\]\\*\\((\\)\\.\\-]+)\\s*\\}\\}", 1)
}

/**
 * A StringLiteral containing a workflow expression ${{}}.
 */
class Expression extends StringLiteral {
  string expr;

  Expression() { expr = getASimpleReferenceExpression(this) }

  string getExpression() { result = expr }

  Job getJob() { result.getAChildNode*() = this }
}

/**
 * A ${{}} expression accessing a context variable such as steps, needs, jobs, env, inputs, or matrix.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 */
class ContextExpression extends Expression {
  ContextExpression() {
    expr.regexpMatch([
        stepsCtxRegex(), needsCtxRegex(), jobsCtxRegex(), envCtxRegex(), inputsCtxRegex(),
        matrixCtxRegex()
      ])
  }

  abstract string getFieldName();

  abstract AstNode getTarget();
}

private string stepsCtxRegex() {
  result = wrapRegexp("steps\\.([A-Za-z0-9_-]+)\\.outputs\\.([A-Za-z0-9_-]+)")
}

private string needsCtxRegex() {
  result = wrapRegexp("needs\\.([A-Za-z0-9_-]+)\\.outputs\\.([A-Za-z0-9_-]+)")
}

private string jobsCtxRegex() {
  result = wrapRegexp("jobs\\.([A-Za-z0-9_-]+)\\.outputs\\.([A-Za-z0-9_-]+)")
}

private string envCtxRegex() { result = wrapRegexp("env\\.([A-Za-z0-9_-]+)") }

private string matrixCtxRegex() { result = wrapRegexp("matrix\\.([A-Za-z0-9_-]+)") }

private string inputsCtxRegex() {
  result = wrapRegexp(["inputs\\.([A-Za-z0-9_-]+)", "github\\.event\\.inputs\\.([A-Za-z0-9_-]+)"])
}

bindingset[regex]
private string wrapRegexp(string regex) {
  result = ["\\b" + regex + "\\b", "fromJSON\\(" + regex + "\\)", "toJSON\\(" + regex + "\\)"]
}

/**
 * Holds for an expression accesing the `steps` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ steps.changed-files.outputs.all_changed_files }}`
 */
class StepsExpression extends ContextExpression {
  string stepId;
  string fieldName;

  StepsExpression() {
    expr.regexpMatch(stepsCtxRegex()) and
    stepId = expr.regexpCapture(stepsCtxRegex(), 1) and
    fieldName = expr.regexpCapture(stepsCtxRegex(), 2)
  }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    this.getLocation().getFile() = result.getLocation().getFile() and
    result.(Step).getId() = stepId
  }
}

/**
 * Holds for an expression accesing the `needs` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ needs.job1.outputs.foo}}`
 */
class NeedsExpression extends ContextExpression {
  Job job;
  string jobId;
  string fieldName;

  NeedsExpression() {
    expr.regexpMatch(needsCtxRegex()) and
    jobId = expr.regexpCapture(needsCtxRegex(), 1) and
    fieldName = expr.regexpCapture(needsCtxRegex(), 2) and
    job.getId() = jobId
  }

  predicate usesReusableWorkflow() { job.usesReusableWorkflow() }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    job.getLocation().getFile() = this.getLocation().getFile() and
    (
      // regular jobs
      job.getOutputs() = result
      or
      // reusable workflow calling jobs
      job.getUses() = result
    )
  }
}

/**
 * Holds for an expression accesing the `jobs` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ jobs.job1.outputs.foo}}` (within reusable workflows)
 */
class JobsExpression extends ContextExpression {
  string jobId;
  string fieldName;

  JobsExpression() {
    expr.regexpMatch(jobsCtxRegex()) and
    jobId = expr.regexpCapture(jobsCtxRegex(), 1) and
    fieldName = expr.regexpCapture(jobsCtxRegex(), 2)
  }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    exists(Job job |
      job.getId() = jobId and
      job.getLocation().getFile() = this.getLocation().getFile() and
      job.getOutputs() = result
    )
  }
}

/**
 * Holds for an expression the `inputs` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ inputs.foo }}`
 */
class InputsExpression extends ContextExpression {
  string fieldName;

  InputsExpression() {
    expr.regexpMatch(inputsCtxRegex()) and
    fieldName = expr.regexpCapture(inputsCtxRegex(), 1)
  }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    result.getLocation().getFile() = this.getLocation().getFile() and
    (
      exists(ReusableWorkflow w | w.getInput(fieldName) = result)
      or
      exists(CompositeAction a | a.getInput(fieldName) = result)
    )
  }
}

/**
 * Holds for an expression accesing the `env` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ env.foo }}`
 */
class EnvExpression extends ContextExpression {
  string fieldName;

  EnvExpression() {
    expr.regexpMatch(envCtxRegex()) and
    fieldName = expr.regexpCapture(envCtxRegex(), 1)
  }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    exists(AstNode s |
      s.getEnvVar(fieldName) = result and
      s.getAChildNode*() = this
    )
  }
}

/**
 * Holds for an expression accesing the `matrix` context.
 * https://docs.github.com/en/actions/learn-github-actions/contexts#context-availability
 * e.g. `${{ matrix.foo }}`
 */
class MatrixExpression extends ContextExpression {
  string fieldName;

  MatrixExpression() {
    expr.regexpMatch(matrixCtxRegex()) and
    fieldName = expr.regexpCapture(matrixCtxRegex(), 1)
  }

  override string getFieldName() { result = fieldName }

  override AstNode getTarget() {
    exists(Workflow w |
      w.getStrategy().getMatrixVariable(fieldName) = result and
      w.getAChildNode*() = this
    )
    or
    exists(Job j |
      j.getStrategy().getMatrixVariable(fieldName) = result and
      j.getAChildNode*() = this
    )
  }
}
