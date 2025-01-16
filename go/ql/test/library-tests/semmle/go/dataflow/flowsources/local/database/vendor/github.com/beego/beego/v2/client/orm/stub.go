// Code generated by depstubber. DO NOT EDIT.
// This is a simple stub for github.com/beego/beego/v2/client/orm, strictly for use in testing.

// See the LICENSE file for information about the licensing of the original library.
// Source: github.com/beego/beego/v2/client/orm (exports: DQL,DB,Ormer; functions: NewOrm)

// Package orm is a stub of github.com/beego/beego/v2/client/orm, generated by depstubber.
package orm

import (
	context "context"
	sql "database/sql"
	sync "sync"
)

type Condition struct{}

func (_ Condition) And(_ string, _ ...interface{}) *Condition {
	return nil
}

func (_ Condition) AndNot(_ string, _ ...interface{}) *Condition {
	return nil
}

func (_ Condition) Or(_ string, _ ...interface{}) *Condition {
	return nil
}

func (_ Condition) OrNot(_ string, _ ...interface{}) *Condition {
	return nil
}

func (_ Condition) Raw(_ string, _ string) *Condition {
	return nil
}

func (_ *Condition) AndCond(_ *Condition) *Condition {
	return nil
}

func (_ *Condition) AndNotCond(_ *Condition) *Condition {
	return nil
}

func (_ *Condition) IsEmpty() bool {
	return false
}

func (_ *Condition) OrCond(_ *Condition) *Condition {
	return nil
}

func (_ *Condition) OrNotCond(_ *Condition) *Condition {
	return nil
}

type DB struct {
	RWMutex *sync.RWMutex
	DB      *sql.DB
}

func (_ DB) Lock() {}

func (_ DB) RLock() {}

func (_ DB) RLocker() sync.Locker {
	return nil
}

func (_ DB) RUnlock() {}

func (_ DB) TryLock() bool {
	return false
}

func (_ DB) TryRLock() bool {
	return false
}

func (_ DB) Unlock() {}

func (_ *DB) Begin() (*sql.Tx, error) {
	return nil, nil
}

func (_ *DB) BeginTx(_ context.Context, _ *sql.TxOptions) (*sql.Tx, error) {
	return nil, nil
}

func (_ *DB) Exec(_ string, _ ...interface{}) (sql.Result, error) {
	return nil, nil
}

func (_ *DB) ExecContext(_ context.Context, _ string, _ ...interface{}) (sql.Result, error) {
	return nil, nil
}

func (_ *DB) Prepare(_ string) (*sql.Stmt, error) {
	return nil, nil
}

func (_ *DB) PrepareContext(_ context.Context, _ string) (*sql.Stmt, error) {
	return nil, nil
}

func (_ *DB) Query(_ string, _ ...interface{}) (*sql.Rows, error) {
	return nil, nil
}

func (_ *DB) QueryContext(_ context.Context, _ string, _ ...interface{}) (*sql.Rows, error) {
	return nil, nil
}

func (_ *DB) QueryRow(_ string, _ ...interface{}) *sql.Row {
	return nil
}

func (_ *DB) QueryRowContext(_ context.Context, _ string, _ ...interface{}) *sql.Row {
	return nil
}

type DQL interface {
	DBStats() *sql.DBStats
	LoadRelated(_ interface{}, _ string, _ ...interface{}) (int64, error)
	LoadRelatedWithCtx(_ context.Context, _ interface{}, _ string, _ ...interface{}) (int64, error)
	QueryM2M(_ interface{}, _ string) QueryM2Mer
	QueryM2MWithCtx(_ context.Context, _ interface{}, _ string) QueryM2Mer
	QueryTable(_ interface{}) QuerySeter
	QueryTableWithCtx(_ context.Context, _ interface{}) QuerySeter
	Read(_ interface{}, _ ...string) error
	ReadForUpdate(_ interface{}, _ ...string) error
	ReadForUpdateWithCtx(_ context.Context, _ interface{}, _ ...string) error
	ReadOrCreate(_ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadOrCreateWithCtx(_ context.Context, _ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadWithCtx(_ context.Context, _ interface{}, _ ...string) error
}

type Driver interface {
	Name() string
	Type() DriverType
}

type DriverType int

type Inserter interface {
	Close() error
	Insert(_ interface{}) (int64, error)
	InsertWithCtx(_ context.Context, _ interface{}) (int64, error)
}

func NewOrm() Ormer {
	return nil
}

type Ormer interface {
	Begin() (TxOrmer, error)
	BeginWithCtx(_ context.Context) (TxOrmer, error)
	BeginWithCtxAndOpts(_ context.Context, _ *sql.TxOptions) (TxOrmer, error)
	BeginWithOpts(_ *sql.TxOptions) (TxOrmer, error)
	DBStats() *sql.DBStats
	Delete(_ interface{}, _ ...string) (int64, error)
	DeleteWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
	DoTx(_ func(context.Context, TxOrmer) error) error
	DoTxWithCtx(_ context.Context, _ func(context.Context, TxOrmer) error) error
	DoTxWithCtxAndOpts(_ context.Context, _ *sql.TxOptions, _ func(context.Context, TxOrmer) error) error
	DoTxWithOpts(_ *sql.TxOptions, _ func(context.Context, TxOrmer) error) error
	Driver() Driver
	Insert(_ interface{}) (int64, error)
	InsertMulti(_ int, _ interface{}) (int64, error)
	InsertMultiWithCtx(_ context.Context, _ int, _ interface{}) (int64, error)
	InsertOrUpdate(_ interface{}, _ ...string) (int64, error)
	InsertOrUpdateWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
	InsertWithCtx(_ context.Context, _ interface{}) (int64, error)
	LoadRelated(_ interface{}, _ string, _ ...interface{}) (int64, error)
	LoadRelatedWithCtx(_ context.Context, _ interface{}, _ string, _ ...interface{}) (int64, error)
	QueryM2M(_ interface{}, _ string) QueryM2Mer
	QueryM2MWithCtx(_ context.Context, _ interface{}, _ string) QueryM2Mer
	QueryTable(_ interface{}) QuerySeter
	QueryTableWithCtx(_ context.Context, _ interface{}) QuerySeter
	Raw(_ string, _ ...interface{}) RawSeter
	RawWithCtx(_ context.Context, _ string, _ ...interface{}) RawSeter
	Read(_ interface{}, _ ...string) error
	ReadForUpdate(_ interface{}, _ ...string) error
	ReadForUpdateWithCtx(_ context.Context, _ interface{}, _ ...string) error
	ReadOrCreate(_ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadOrCreateWithCtx(_ context.Context, _ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadWithCtx(_ context.Context, _ interface{}, _ ...string) error
	Update(_ interface{}, _ ...string) (int64, error)
	UpdateWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
}

type Params map[string]interface{}

type ParamsList []interface{}

type QueryM2Mer interface {
	Add(_ ...interface{}) (int64, error)
	AddWithCtx(_ context.Context, _ ...interface{}) (int64, error)
	Clear() (int64, error)
	ClearWithCtx(_ context.Context) (int64, error)
	Count() (int64, error)
	CountWithCtx(_ context.Context) (int64, error)
	Exist(_ interface{}) bool
	ExistWithCtx(_ context.Context, _ interface{}) bool
	Remove(_ ...interface{}) (int64, error)
	RemoveWithCtx(_ context.Context, _ ...interface{}) (int64, error)
}

type QuerySeter interface {
	Aggregate(_ string) QuerySeter
	All(_ interface{}, _ ...string) (int64, error)
	AllWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
	Count() (int64, error)
	CountWithCtx(_ context.Context) (int64, error)
	Delete() (int64, error)
	DeleteWithCtx(_ context.Context) (int64, error)
	Distinct() QuerySeter
	Exclude(_ string, _ ...interface{}) QuerySeter
	Exist() bool
	ExistWithCtx(_ context.Context) bool
	Filter(_ string, _ ...interface{}) QuerySeter
	FilterRaw(_ string, _ string) QuerySeter
	ForUpdate() QuerySeter
	ForceIndex(_ ...string) QuerySeter
	GetCond() *Condition
	GroupBy(_ ...string) QuerySeter
	IgnoreIndex(_ ...string) QuerySeter
	Limit(_ interface{}, _ ...interface{}) QuerySeter
	Offset(_ interface{}) QuerySeter
	One(_ interface{}, _ ...string) error
	OneWithCtx(_ context.Context, _ interface{}, _ ...string) error
	OrderBy(_ ...string) QuerySeter
	OrderClauses(_ ...interface{}) QuerySeter
	PrepareInsert() (Inserter, error)
	PrepareInsertWithCtx(_ context.Context) (Inserter, error)
	RelatedSel(_ ...interface{}) QuerySeter
	RowsToMap(_ *Params, _ string, _ string) (int64, error)
	RowsToStruct(_ interface{}, _ string, _ string) (int64, error)
	SetCond(_ *Condition) QuerySeter
	Update(_ Params) (int64, error)
	UpdateWithCtx(_ context.Context, _ Params) (int64, error)
	UseIndex(_ ...string) QuerySeter
	Values(_ *[]Params, _ ...string) (int64, error)
	ValuesFlat(_ *ParamsList, _ string) (int64, error)
	ValuesFlatWithCtx(_ context.Context, _ *ParamsList, _ string) (int64, error)
	ValuesList(_ *[]ParamsList, _ ...string) (int64, error)
	ValuesListWithCtx(_ context.Context, _ *[]ParamsList, _ ...string) (int64, error)
	ValuesWithCtx(_ context.Context, _ *[]Params, _ ...string) (int64, error)
}

type RawPreparer interface {
	Close() error
	Exec(_ ...interface{}) (sql.Result, error)
}

type RawSeter interface {
	Exec() (sql.Result, error)
	Prepare() (RawPreparer, error)
	QueryRow(_ ...interface{}) error
	QueryRows(_ ...interface{}) (int64, error)
	RowsToMap(_ *Params, _ string, _ string) (int64, error)
	RowsToStruct(_ interface{}, _ string, _ string) (int64, error)
	SetArgs(_ ...interface{}) RawSeter
	Values(_ *[]Params, _ ...string) (int64, error)
	ValuesFlat(_ *ParamsList, _ ...string) (int64, error)
	ValuesList(_ *[]ParamsList, _ ...string) (int64, error)
}

type TxOrmer interface {
	Commit() error
	DBStats() *sql.DBStats
	Delete(_ interface{}, _ ...string) (int64, error)
	DeleteWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
	Driver() Driver
	Insert(_ interface{}) (int64, error)
	InsertMulti(_ int, _ interface{}) (int64, error)
	InsertMultiWithCtx(_ context.Context, _ int, _ interface{}) (int64, error)
	InsertOrUpdate(_ interface{}, _ ...string) (int64, error)
	InsertOrUpdateWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
	InsertWithCtx(_ context.Context, _ interface{}) (int64, error)
	LoadRelated(_ interface{}, _ string, _ ...interface{}) (int64, error)
	LoadRelatedWithCtx(_ context.Context, _ interface{}, _ string, _ ...interface{}) (int64, error)
	QueryM2M(_ interface{}, _ string) QueryM2Mer
	QueryM2MWithCtx(_ context.Context, _ interface{}, _ string) QueryM2Mer
	QueryTable(_ interface{}) QuerySeter
	QueryTableWithCtx(_ context.Context, _ interface{}) QuerySeter
	Raw(_ string, _ ...interface{}) RawSeter
	RawWithCtx(_ context.Context, _ string, _ ...interface{}) RawSeter
	Read(_ interface{}, _ ...string) error
	ReadForUpdate(_ interface{}, _ ...string) error
	ReadForUpdateWithCtx(_ context.Context, _ interface{}, _ ...string) error
	ReadOrCreate(_ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadOrCreateWithCtx(_ context.Context, _ interface{}, _ string, _ ...string) (bool, int64, error)
	ReadWithCtx(_ context.Context, _ interface{}, _ ...string) error
	Rollback() error
	RollbackUnlessCommit() error
	Update(_ interface{}, _ ...string) (int64, error)
	UpdateWithCtx(_ context.Context, _ interface{}, _ ...string) (int64, error)
}
