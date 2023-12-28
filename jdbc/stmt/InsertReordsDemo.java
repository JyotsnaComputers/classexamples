package jdbc.stmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertReordsDemo {

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
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");
			stmt = connection.createStatement();

			String sql = "insert into DEPT (DEPTNO, DNAME, LOC) " + "values(50, 'SOFTWARE', 'DELHI')";
			int records = stmt.executeUpdate(sql);

			System.out.println(records + " Record(s) inserted ");

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