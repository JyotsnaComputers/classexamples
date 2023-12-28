package jdbc.stmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCDemo {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.exit(0);
		}
		Connection connection = null;
		Statement stmt = null;
		// boolean execute(String sql) --- DDL
		// int executeUpdate(String sql) --- DML
		// ResultSet executeQuery(String sql) -- DQL

		ResultSet rset = null;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");

			stmt = connection.createStatement();

			rset = stmt.executeQuery("select * from emp");

//			if (rset.next()) {
//				int empno = rset.getInt(1);
//				String ename = rset.getString(2);
//				String job = rset.getString("job");
//				int mgr = rset.getInt("mgr");
//				Date hireDate = rset.getDate("hiredate");
//				int sal = rset.getInt("sal");
//				int comm = rset.getInt("comm");
//				int deptno = rset.getInt("deptno");
//
//				System.out.println("Employee ID : " + empno);
//				System.out.println("Employee Name : " + ename);
//				System.out.println("Employee Job : " + job);
//				System.out.println("Employee Manager : " + mgr);
//				System.out.println("Employee HireDate : " + hireDate);
//				System.out.println("Employee Salary : " + sal);
//				System.out.println("Employee Commission : " + comm);
//				System.out.println("Employee Department Number : " + deptno);
//			}

			while (rset.next()) {
				System.out.println(rset.getString(1) + " " + rset.getString(2) + " " + rset.getString(3));
			}
		} catch (SQLException sex) {
			System.out.println(sex.getMessage());
		} finally {
			try {
				if (rset != null)
					rset.close();
			} catch (Exception ex) {
				System.out.println(ex.getCause() + ex.getMessage());
			}
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