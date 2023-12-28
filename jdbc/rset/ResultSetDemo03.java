package jdbc.rset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ResultSetDemo03 {

	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");

		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet resultSet = stmt.executeQuery("select * from dept");

		resultSet.moveToInsertRow();
		resultSet.updateInt("deptno", 50);
		resultSet.updateString(2, "Software");
		resultSet.updateString(3, "Philadelphia");
		resultSet.insertRow();

		resultSet.beforeFirst();

		while (resultSet.next()) {
			System.out.println(resultSet.getInt(1) + "\t" + resultSet.getString(2) + "\t" + resultSet.getString(3));
		}
	}
}