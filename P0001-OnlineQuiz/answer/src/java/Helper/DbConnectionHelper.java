package Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class DbConnectionHelper {

    public static Connection connection;

    private DbConnectionHelper() {
    }
    private static String connectionString;
    private static String user;
    private static String pass;
//    private static String connectionString;
//    private static String user;
//    private static String pass;

    public static void initConnection(String connectionString, String user, String pass) throws NamingException {
        DbConnectionHelper.connectionString = connectionString;
        DbConnectionHelper.user = user;
        DbConnectionHelper.pass = pass;
    }

    public static void init() {
        try {
            InitialContext initContext = new InitialContext();
            Context env = (Context) initContext.lookup("java://comp/env");
            String connectionUrl = (String) env.lookup("connectionUrl");
            String dbName = (String) env.lookup("dbname");
            String username = (String) env.lookup("user");
            String password = (String) env.lookup("pass");
            DbConnectionHelper.initConnection(connectionUrl + ";databaseName=" + dbName, username, password);
        } catch (NamingException ex) {
            Logger.getLogger(DbConnectionHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        init();
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(connectionString, user, pass);
        return connection;
    }

    public static void closeConnection(Connection connection, ResultSet resultSet, PreparedStatement statement) throws Exception {
        if ((resultSet != null) && (!resultSet.isClosed())) {
            resultSet.close();
        }
        if ((statement != null) && (!statement.isClosed())) {
            statement.close();
        }
        if ((connection != null) && (!connection.isClosed())) {
            connection.close();
        }
    }

    public static void main(String[] args) {
        try {
            System.out.println(DbConnectionHelper.getConnection());
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DbConnectionHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
