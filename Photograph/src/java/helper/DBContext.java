package helper;

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
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author 84963
 */
public class DBContext implements ServletContextListener {

    InitialContext initial;
    Context context;
    public static String dbname, serverName, portNumber, image, username, password;

    public DBContext() throws Exception {
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbname;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, username, password);
    }

    public void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }

    public String getResource() {
        return image;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            initial = new InitialContext();
            context = (Context) initial.lookup("java:comp/env");
            serverName = context.lookup("serverName").toString();
            dbname = context.lookup("dbName").toString();
            portNumber = context.lookup("port").toString();
            image = context.lookup("image").toString();
            username = context.lookup("username").toString();
            password = context.lookup("password").toString();
        } catch (NamingException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

}
