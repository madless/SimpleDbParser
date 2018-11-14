
import com.madless.simpledb.gen.RequestLexer
import com.madless.simpledb.gen.RequestParser
import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ErrorNode
import org.antlr.v4.runtime.tree.ParseTree
import org.antlr.v4.runtime.tree.RuleNode
import org.antlr.v4.runtime.tree.TerminalNode
import java.nio.charset.StandardCharsets


fun main(args: Array<String>) {
//    val text = "select id,text from mytable where id = 10 AND text = 'Hello';" // mytable[id, text]
//    val text = "create table mytable (id int, name text);"
//    val text = "insert into mytable values (1, 'John', 19);"
    val text = "select * from mytable;"
    val stream = text.byteInputStream(StandardCharsets.UTF_8)
    val inputStream = ANTLRInputStream(stream)
    val requestLexer = RequestLexer(inputStream)
    val commonTokenStream = CommonTokenStream(requestLexer)
    val requestParser = RequestParser(commonTokenStream)


    val commandResult = requestParser.parse()
    commandResult?.statement?.execute()

//    println("commandResult ${commandResult}")

//    val visitor = SqlRequestVisitor()
//    val baseVisitor = RequestParserBaseVisitor<String>()
//    val visited = visitor.visit(commandResult)
//    val visited = baseVisitor.visit(commandResult)
//    println("visited $visited")
}

//class SqlRequestVisitor : RequestParserBaseVisitor<String?>() {
//
//    /* RequestParserVisitor */
//
//    override fun visitCommand(ctx: RequestParser.CommandContext?): String? {
//        println("visitCommand  ${ctx?.text} childCount ${ctx?.childCount}  name ${ctx?.NAME()}")
//        return visitChildren(ctx)
//    }
//
//    override fun visitColumns(ctx: RequestParser.ColumnsContext?): String? {
//        println("visitColumns ${ctx?.text}")
//        return ""
//    }
//
//    override fun visitExpression(ctx: RequestParser.ExpressionContext?): String? {
//        println("visitExpression  ${ctx?.text} childCount ${ctx?.childCount}  name ${ctx?.NAME()}")
//        if (ctx?.NAME() == null) {
//            return visitChildren(ctx)
//        } else {
//            return ""
//        }
//    }
//
//
//    override fun visitErrorNode(node: ErrorNode?): String? {
//        println("!!!!! visitErrorNode ${node?.text}")
//        return ""
//    }
//
//    override fun visitTerminal(node: TerminalNode?): String? {
//        println("visitTerminal ${node?.text}")
//        return super.visitTerminal(node)
//    }
//
//
//}