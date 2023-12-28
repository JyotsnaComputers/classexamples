package jdbc.pstmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreatedDemo {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.exit(0);
		}
		Connection connection = null;
		PreparedStatement pstmt = null;

		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");
			String sql = "create table deptnew(   " + "  deptno     decimal(2,0),   " + "  dname      varchar(14),   "
					+ "  loc        varchar(13),   " + "  constraint pk_dept primary key (deptno)  "
					+ ") CHARSET=utf8 COLLATE=utf8_bin;";

			pstmt = connection.prepareStatement(sql);

			pstmt.execute();

			System.out.println(" Table Created ");

		} catch (SQLException sex) {
			System.out.println(sex.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
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
