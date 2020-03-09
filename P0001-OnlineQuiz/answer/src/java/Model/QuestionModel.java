package Model;

import Helper.DbConnectionHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import Model.Entity.*;
import java.sql.SQLException;

public class QuestionModel {

    private Connection connection;
    private SimpleDateFormat formatter;

    public QuestionModel() {
        formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    }

    public QuestionModel(Connection connection, SimpleDateFormat formatter) {
        this.connection = connection;
        this.formatter = formatter;
    }

    public List<Question> getQuestions() throws Exception {
        ArrayList<Question> questions = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        try {
            connection = DbConnectionHelper.getConnection();
            String query = "SELECT [id]\n"
                    + "      ,[content]\n"
                    + "      ,[opt1]\n"
                    + "      ,[opt2]\n"
                    + "      ,[opt3]\n"
                    + "      ,[opt4]\n"
                    + "      ,[answer]\n"
                    + "      ,[created]\n"
                    + "  FROM [dbo].[Question]";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Question q = new Question(resultSet.getInt("id"),
                        resultSet.getNString("content"),
                        resultSet.getNString("answer"),
                        formatter.parse(resultSet.getString("created")));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
                questions.add(q);
            }
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return questions;
    }

    public ArrayList<Question> getQuestionsInRange(int from, int to) throws Exception {
        ArrayList<Question> questions = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            String query = "Select * from (select ROW_NUMBER() Over (order by id) AS rowNum, * From Question) AS a where rowNum >= ? and rowNum < ?;";
            statement = connection.prepareStatement(query);
            statement.setInt(1, from);
            statement.setInt(2, to);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Question q = new Question(resultSet.getInt("id"),
                        resultSet.getNString("content"),
                        resultSet.getNString("answer"),
                        formatter.parse(resultSet.getString("created")));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
                questions.add(q);
            }
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return questions;
    }

    public void addQueston(Question q) throws Exception {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            String query = "insert into Question (content, opt1, opt2, opt3, opt4, answer) values(?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, q.getContent());
            statement.setString(2, q.getOption().get(0));
            statement.setString(3, q.getOption().get(1));
            statement.setString(4, q.getOption().get(2));
            statement.setString(5, q.getOption().get(3));
            statement.setString(6, q.getAnswer());
            statement.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
    }

    public void deleteQueston(int id) throws Exception {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            String query = "delete from Question where id=?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
    }

    public Question findQuestionById(int id) throws Exception {
        Question q = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareCall("SELECT [id]\n"
                    + "      ,[content]\n"
                    + "      ,[opt1]\n"
                    + "      ,[opt2]\n"
                    + "      ,[opt3]\n"
                    + "      ,[opt4]\n"
                    + "      ,[answer]\n"
                    + "      ,[created]\n"
                    + "  FROM [dbo].[Question]\n"
                    + "  WHERE id = ?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                q = new Question(resultSet.getInt("id"),
                        resultSet.getNString("content"),
                        resultSet.getNString("answer"),
                        formatter.parse(resultSet.getString("created")));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
            }
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return q;
    }

    public int getQuestionSize() throws Exception {
        int size = 0;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConnectionHelper.getConnection();
            statement = connection.prepareStatement("SELECT COUNT(*) as size FROM Question");
            resultSet = statement.executeQuery();
            resultSet.next();
            size = resultSet.getInt("size");
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            DbConnectionHelper.closeConnection(connection, resultSet, statement);
        }
        return size;
    }

    public static void main(String[] args) throws Exception {
        QuestionModel q = new QuestionModel();
        System.out.println(q.getQuestionSize());
    }
}
