package com.madless.simpledb.statement

class SelectStatement(val tableName: String,
                      val columns: List<String> = ArrayList(),
                      val filters: String): Statement {
    override fun execute() {
        println("Select executed! tableName $tableName columns $columns filters $filters")
    }

    fun getAllColumns() : String {
        if (!columns.isEmpty()) {
            var allColumns = ""
            for ((i, value) in columns.withIndex()) {
                allColumns += value
                if (i != columns.size - 1) {
                    allColumns += ", "
                }
            }
            return allColumns
        } else {
            return "*"
        }
    }

}