package model;

import entity.Photographer;
import helper.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author 84963
 */
public class InfoDAO {

    public Photographer getInfo() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Photographer p = new Photographer();
        String sql = "SELECT [address]\n"
                + "      ,[city]\n"
                + "      ,[country]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[about]\n"
                + "      ,[special_image]\n"
                + "      ,[title]\n"
                + "       ,[map]\n"
                + "  FROM [dbo].[PhotographerInfo]";
        try {           
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setAddress(rs.getString("address"));
                p.setCity(rs.getString("city"));
                p.setCountry(rs.getString("country"));
                p.setPhone(rs.getString("phone"));
                p.setEmail(rs.getString("email"));
                p.setAboutMe(rs.getString("about"));
                p.setSpecialImage(db.getResource() + rs.getString("special_image"));
                p.setMap(db.getResource() + rs.getString("map"));
                p.setTitle(rs.getString("title"));
            }
            return p;
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
