package pl.sdacademy.jsp.repository;

import pl.sdacademy.jsp.beans.User;
import pl.sdacademy.jsp.config.JdbcConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRepository {

    private static final String CREATE_USER_SQL =
            "INSERT INTO `servlets`.`users` (`name`, `surname`, `email`, `photo`) VALUES (?, ?, ?, ?)";

    public void save(User user) {
        Connection connection = JdbcConfig.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_USER_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPhoto());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
