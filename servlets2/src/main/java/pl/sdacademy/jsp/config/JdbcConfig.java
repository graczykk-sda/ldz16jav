package pl.sdacademy.jsp.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcConfig {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Properties info = new Properties();
            info.setProperty("user", "root");
            info.setProperty("password", "root");
            info.setProperty("serverTimezone","UTC");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/servlets", info);
        } catch (SQLException e) {
            throw new RuntimeException("Cannot obtain connection to database", e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Class not found", e);
        }
    }
}
