package jdbc.batch;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BatchDemo {

	public static void main(String[] args) throws Exception {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = null;
		Statement stmt = null;
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

		// Create statement object
		stmt = connection.createStatement();

		// Set auto-commit to false
		connection.setAutoCommit(false);

		// Create SQL statement
		String sql = "INSERT INTO Emp VALUES (8198, 'MOJ', 'SALESMAN', 7839, '1985-11-5', 1550, null, 30 )";
		// Add above SQL statement in the batch.
		stmt.addBatch(sql);

		// Create one more SQL statement
		sql = "INSERT INTO Emp VALUES (8187, 'KIM', 'SALESMAN', 7839, '1987-1-22', 1650, null, 30 )";
		// Add above SQL statement in the batch.
		stmt.addBatch(sql);

		// Create one more SQL statement
		sql = "UPDATE Emp SET COMM = 0 " + "WHERE COMM IS NULL";
		// Add above SQL statement in the batch.
		stmt.addBatch(sql);

		// Create an int[] to hold returned values
		int[] count = stmt.executeBatch();

		// Explicitly commit statements to apply changes
		connection.commit();

		for (int i = 0; i < count.length; i++) {
			System.out.print(count[i] + "\t");
		}
		System.out.println();
	}
}