package jdbc.rset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class ResultSetDemo02 {

	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/org", "root", "Jct@123456");

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/orac", "root", "Jct@123456");

		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		ResultSet rset = stmt.executeQuery("select empno, ename, job, deptno from emp");

		int choice = 0;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("1. Next Record ");
			System.out.println("2. Previous Record ");
			System.out.println("3. First Record ");
			System.out.println("4. Last Record ");
			System.out.println("5. STOP ");
			System.out.println("\nEnter your Choice ");

			choice = sc.nextInt();
			switch (choice) {
			case 1:
				next(rset);
				break;
			case 2:
				previous(rset);
				break;
			case 3:
				first(rset);
				break;
			case 4:
				last(rset);
				break;
			case 5:
				System.exit(0);
				break;
			default:
				System.out.println(" *** Invalid Choice ***");
			}
		} while (choice != 5);

		sc.close();
	}

	private static void next(ResultSet rset) throws Exception {
		if (rset.isLast()) {
			rset.beforeFirst();
		}
		rset.next();
		System.out.println("Row " + rset.getRow());
		System.out.println(rset.getString("empno") + " " + rset.getString("ename") + " " + rset.getString("job") + " "
				+ rset.getString("deptno"));
	}

	private static void previous(ResultSet rset) throws Exception {
		if (rset.isFirst()) {
			rset.afterLast();
		}
		rset.previous();
		System.out.println("Row " + rset.getRow());
		System.out.println(rset.getString("empno") + " " + rset.getString("ename") + " " + rset.getString("job") + " "
				+ rset.getString("deptno"));
	}

	private static void last(ResultSet rset) throws Exception {
		rset.last();
		System.out.println("Row " + rset.getRow());
		System.out.println(rset.getString("empno") + " " + rset.getString("ename") + " " + rset.getString("job") + " "
				+ rset.getString("deptno"));
	}

	private static void first(ResultSet rset) throws Exception {
		rset.first();
		System.out.println("Row " + rset.getRow());
		System.out.println(rset.getString("empno") + " " + rset.getString("ename") + " " + rset.getString("job") + " "
				+ rset.getString("deptno"));
	}
}