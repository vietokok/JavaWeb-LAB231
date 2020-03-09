package Model;

import Helper.DbConnectionHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Entity.*;
import java.sql.SQLException;

public class QuizHistoryModel {

    private Connection connection;

    public void addEntry(int id, int numOfQuiz, int correctAnswer) throws Exception {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareStatement("insert into QuizHistory (studentId, numOfQuiz, correctAnswer) values (?,?,?)");
            statement.setInt(1, id);
            statement.setInt(2, numOfQuiz);
            statement.setInt(3, correctAnswer);
            statement.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
    }

    public List<QuizHistory> getAllEntry() throws Exception {
        List<QuizHistory> history = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareStatement("Select QuizHistory.*, Users.username from QuizHistory inner join Users on QuizHistory.studentId = Users.id;");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                history.add(new QuizHistory(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getInt("numOfQuiz"), resultSet.getInt("correctAnswer")));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return history;
    }
}
