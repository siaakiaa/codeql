// -----------------------------------------------------------------------------
// Data flow through pointers.

fn source(i: i64) -> i64 {
    1000 + i
}

fn sink(s: i64) {
    println!("{}", s);
}

fn read_through_borrow() {
    let a = source(21);
    let b = &a;
    let c = *b;
    sink(c); // $ MISSING: hasValueFlow=21
}

fn write_through_borrow() {
    let mut a = 1;
    sink(a);
    let b = &mut a;
    *b = source(39);
    sink(a); // $ MISSING: hasValueFlow=39
}

fn write_and_read_through_borrow() {
    let mut a = 12;
    let b = &mut a;
    sink(*b);
    *b = source(37);
    sink(*b); // $ MISSING: hasValueFlow=37
}

enum MyNumber {
    MyNumber(i64)
}

impl MyNumber {
    fn to_number(self) -> i64 {
        match self {
            MyNumber::MyNumber(number) => {
                number
            }
        }
    }

    fn get_number(&self) -> i64 {
        match self {
            MyNumber::MyNumber(number) => {
                *number
            }
        }
    }
}

fn through_self_in_method_no_borrow() {
    let my_number = MyNumber::MyNumber(source(33));
    sink(my_number.to_number()); // $ hasValueFlow=33
}

fn through_self_in_method_implicit_borrow() {
    let my_number = MyNumber::MyNumber(source(85));
    sink(my_number.get_number()); // $ MISSING: hasValueFlow=85
}

fn through_self_in_method_explicit_borrow() {
    let my_number = &MyNumber::MyNumber(source(40));
    sink(my_number.get_number()); // $ MISSING: hasValueFlow=40
}

fn main() {
    read_through_borrow();
    write_through_borrow();
    write_and_read_through_borrow();
    through_self_in_method_no_borrow();
    through_self_in_method_implicit_borrow();
    through_self_in_method_explicit_borrow();
}
