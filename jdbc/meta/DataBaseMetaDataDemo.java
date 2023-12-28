package jdbc.meta;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DataBaseMetaDataDemo {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

		// Creating the DatabaseMetaData object
		DatabaseMetaData dbMetaData = con.getMetaData();

		// invoke the supportsBatchUpdates() method.
		boolean bool = dbMetaData.supportsBatchUpdates();

		// checking is ResultSet instances are closed when connection.commit()
		dbMetaData.supportsResultSetHoldability(ResultSet.CLOSE_CURSORS_AT_COMMIT);

		// Checking can keep same ResultSet instances after connection.commit()
		dbMetaData.supportsResultSetHoldability(ResultSet.HOLD_CURSORS_OVER_COMMIT);

		if (bool) {
			System.out.println("Underlying database supports batch updates");
		} else {
			System.out.println("Underlying database doesnt supports batch updates");
		}
		System.out.println();

		System.out.println("Data Base Name : " + dbMetaData.getDatabaseProductName());
		System.out.println();

		System.out.println("Data Base Version : " + dbMetaData.getDatabaseProductVersion());
		System.out.println();

		// Retrieving the driver name
		System.out.println("Driver Name  " + dbMetaData.getDriverName());
		System.out.println();

		// Retrieving the driver version
		System.out.println("Driver Version " + dbMetaData.getDriverVersion());
		System.out.println();

		// Retrieving the user name
		System.out.println("User Name : " + dbMetaData.getUserName());
		System.out.println();

		// Retrieving the URL
		System.out.println("DB URL " + dbMetaData.getURL());
		System.out.println();

		// Retrieving the list of numeric functions
		System.out.println("Numeric functions: " + dbMetaData.getNumericFunctions());
		System.out.println();

		// Retrieving the list of String functions
		System.out.println("String functions: " + dbMetaData.getStringFunctions());
		System.out.println();

		// Retrieving the list of system functions
		System.out.println("System functions: " + dbMetaData.getSystemFunctions());
		System.out.println();

		// Retrieving the list of time and date functions
		System.out.println("Time and Date funtions: " + dbMetaData.getTimeDateFunctions());
	}
}
