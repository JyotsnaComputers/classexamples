package jdbc.stmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDemo {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.exit(0);
		}
		Connection connection = null;
		Statement stmt = null;

		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");
			stmt = connection.createStatement();

			String sql = "create table deptnew(   " + "  deptno     decimal(2,0),   " + "  dname      varchar(14),   "
					+ "  loc        varchar(13),   " + "  constraint pk_dept primary key (deptno)  "
					+ ") CHARSET=utf8 COLLATE=utf8_bin;";
			stmt.execute(sql);

			System.out.println(" Table Created ");

		} catch (SQLException sex) {
			System.out.println(sex.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception ex) {
				System.out.println(ex.getCause() + ex.getMessage());
			}
			try {
				if (connection != null)
					connection.close();
			} catch (Exception ex) {
				System.out.println(ex.getCause() + ex.getMessage());
			}
		}
	}
}
