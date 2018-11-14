parser grammar RequestParser;

@header {
package com.madless.simpledb.gen;

import com.madless.simpledb.statement.*;
import java.util.*;
import com.madless.simpledb.model.*;
}

options { tokenVocab=RequestLexer; }

/*
 * Parser Rules
 */

parse returns [Statement statement]
: sql_statement EOL EOF
{$statement = $sql_statement.statement;}
;

sql_statement returns [Statement statement]
: select_statement {$statement = $select_statement.statement;}
| create_statement {$statement = $create_statement.statement;}
| insert_statement {$statement = $insert_statement.statement;}
| drop_statement {$statement = $drop_statement.statement;}
;

select_statement returns [Statement statement]
: SELECT columns_list FROM table_name (WHERE expression)?
{$statement = new SelectStatement($table_name.text, $columns_list.defFields, $expression.text != null ? $expression.text : "");}
;

create_statement returns [Statement statement]
: CREATE TABLE table_name OPEN_BRACKET columns_info CLOSE_BRACKET
{$statement = new CreateStatement($table_name.text, $columns_info.columns);}
;

insert_statement returns [Statement statement]
: INSERT INTO table_name VALUES OPEN_BRACKET column_values CLOSE_BRACKET
{$statement = new InsertStatement($table_name.text, $column_values.values);}
;

drop_statement returns [Statement statement]
: DROP TABLE drop_param table_name
{$statement = new DropStatement($table_name.text, $drop_param.text);}
;

columns_list returns [List<String> defFields]
@init {$defFields = new LinkedList<String>();}
: ANY | ((column_name {$defFields.add($column_name.text);})
        | (column_name COMMA {$defFields.add($column_name.text);}))+
;

expression :
    (NAME OPERATOR VALUE)
    | (NAME LOGIC_OPERATOR NAME)
    | expression OPERATOR expression
    | expression LOGIC_OPERATOR expression ;

table_name : NAME ;

column_name : NAME ;

column_type : TYPE_TEXT | TYPE_INT ;

column_value : VALUE ;

drop_param : IF_EXISTS? ;

column_values returns [List<String> values]
@init {$values = new LinkedList<String>();}
: (column_value ',' {$values.add($column_value.text);} )* column_value {$values.add($column_value.text);}
;

column_info returns [Column column]
: column_name column_type
{$column = new Column($column_name.text, $column_type.text);}
;

columns_info returns [List<Column> columns]
@init {$columns = new LinkedList<Column>();}
: (column_info ','{$columns.add($column_info.column);})* column_info {$columns.add($column_info.column);}
;


