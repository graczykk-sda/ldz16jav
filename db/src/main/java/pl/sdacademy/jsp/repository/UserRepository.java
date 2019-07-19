package pl.sdacademy.jsp.repository;

import pl.sdacademy.jsp.domain.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRepository {

    private static final String USER_SAVE_SQL = "INSERT INTO `servlets`.`users` (`name`, `surname`, `photoUrl`) VALUES ('%s', '%s', '%s')";

    private Connection connection;

    public UserRepository(Connection connection) {
        this.connection = connection;
    }

    public void save(User user) {
        String parametrizedSql = String.format(USER_SAVE_SQL, user.getName(), user.getSurname(), user.getPhotoUrl());
        try (PreparedStatement preparedStatement = connection.prepareStatement(parametrizedSql)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
