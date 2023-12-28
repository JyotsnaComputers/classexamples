package jdbc.pstmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertRecordsDemo {

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
			String sql = "insert into DEPTnew (DEPTNO, DNAME, LOC) values(?, ?, ?)";
			pstmt = connection.prepareStatement(sql);

			Scanner scan = new Scanner(System.in);

			System.out.println("Enter department number ");
			int deptno = scan.nextInt();

			System.out.println("Enter department Name ");
			String dname = scan.next();

			System.out.println("Enter Location Name ");
			String loc = scan.next();

			pstmt.setInt(1, deptno);
			pstmt.setString(2, dname);
			pstmt.setString(3, loc);

			int records = pstmt.executeUpdate();

			System.out.println(records + " Record(s) inserted ");

			scan.close();

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