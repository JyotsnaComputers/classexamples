package jdbc.meta;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class ResultSetMetaDataDemo {

	public static void main(String[] args) throws Exception {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = null;
		Statement stmt = null;
		ResultSet rset = null;

		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");

		stmt = connection.createStatement();

		rset = stmt.executeQuery("select * from emp");
		ResultSetMetaData rsmd = rset.getMetaData();

		for (int col = 1; col <= rsmd.getColumnCount(); col++) {
			System.out.print(rsmd.getColumnName(col) + "- \t - ");
		}
		System.out.println();
		while (rset.next()) {
			for (int col = 1; col <= rsmd.getColumnCount(); col++) {
				System.out.print(rset.getString(col) + " - \t - ");
			}
			System.out.println();
		}
	}
}