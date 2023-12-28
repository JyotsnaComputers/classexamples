package jdbc.trans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class TransactionDemo01 {

	public static void main(String[] args) throws Exception {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");
		conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();

		String sql = "INSERT INTO Emp " + "VALUES (7998, 'JOE', 'SALESMAN', 7839, '1983-1-15', 1350, null, 30  )";
		stmt.executeUpdate(sql);
		// Submit a malformed SQL statement that breaks
		sql = "INSERTED IN Emp  " + "VALUES (8176, 'MARK', 'CLERK', 7788,  " + " '1989-8-30', " + " 1100, null, 20  "
				+ ")";
		stmt.executeUpdate(sql);
		// If there is no error.
		conn.commit();
	}

}
