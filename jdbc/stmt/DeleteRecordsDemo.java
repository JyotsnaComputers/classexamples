package jdbc.stmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteRecordsDemo {

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

			String sql = "delete from dept where deptno = 50";
			int records = stmt.executeUpdate(sql);

			System.out.println(records + " Record(s) Deleted ");

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
