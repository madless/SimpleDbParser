package com.madless.simpledb.statement

class DropStatement(val tableName: String, val param: String) : Statement {
    override fun execute() {
        println("execute Drop tableName $tableName param $param")
    }
}