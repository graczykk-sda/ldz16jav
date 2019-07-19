package pl.sdacademy.jsp.db;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcService {

    private static Connection connection = null;

    public static synchronized Connection getConnection() {
        if (connection == null) {
            connection =  getNewConnection();
        }
        return connection;
    }

    private static Connection getNewConnection() {
        try {
            DriverManager.registerDriver(new Driver());
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/servlets", "root", "root");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            connection = null;
        }
    }
}
