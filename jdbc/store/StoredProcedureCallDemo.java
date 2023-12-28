package jdbc.store;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StoredProcedureCallDemo {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.exit(0);
		}
		Connection connection = null;
		CallableStatement cstmt = null;

		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

			cstmt = connection.prepareCall("CALL insertRecs(104,'IT','Hyderabad')");

			ResultSet rset = cstmt.executeQuery();

			while (rset.next()) {
				for (int i = 1; i <= rset.getMetaData().getColumnCount(); i++) {
					System.out.print(rset.getString(i) + " ");
				}
				System.out.println();
			}
		} catch (SQLException sex) {
			System.out.println(sex.getMessage());
		} finally {
			try {
				if (cstmt != null)
					cstmt.close();
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
