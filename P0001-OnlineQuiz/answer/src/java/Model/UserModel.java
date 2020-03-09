package Model;

import Helper.DbConnectionHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Entity.*;
import java.sql.SQLException;

public class UserModel {

    private Connection connection;

    public UserModel() {
    }

    public User login(String userName, String password) throws Exception {
        User user = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareStatement("select * from Users where username=? and password=?");
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getInt("type"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return user;
    }

    public int validateNewUser(User user) throws Exception {
        int returnValue = 0;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareStatement("select * from Users where username=? or email=?");
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getString("username").equals(user.getUserName())) {
                    returnValue = 1;
                    break;
                }
                if (resultSet.getString("email").equals(user.getEmail())) {
                    returnValue = 2;
                    break;
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return returnValue;
    }

    public void addUser(User newUser) throws Exception {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            String query = "Insert into Users (username,password,email,type) values(?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, newUser.getUserName());
            statement.setString(2, newUser.getPassword());
            statement.setString(3, newUser.getEmail());
            statement.setInt(4, newUser.getType());
            statement.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
    }
}
