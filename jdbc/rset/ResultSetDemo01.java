package jdbc.rset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ResultSetDemo01 {

	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");

		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select empno, job, ename,  deptno from emp");

		System.out.print(rset.findColumn("job") + "\t");
		System.out.println(rset.findColumn("ename"));

		rset = stmt.executeQuery("select * from emp");
		System.out.print(rset.findColumn("job") + "\t");
		System.out.println(rset.findColumn("ename"));
	}
}