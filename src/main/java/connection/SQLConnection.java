package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnection {
	
	public static String contextPath = "http://localhost:8080/Maze_Bank/";
	
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String dburl = "jdbc:sqlserver://localhost;databaseName=Bank;user=sa;password=123;trustServerCertificate=true;";
        Connection con = DriverManager.getConnection(dburl);
        return con;
    }

}
