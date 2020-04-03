/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Gallery;
import entity.Image;
import helper.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author 84963
 */
public class GalleryDAO {

    public ArrayList<Gallery> getListGallerySearch(int numberArticleInPage, int pageCurrent) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Gallery> listGallery = new ArrayList<>();

        String sql = "SELECT * FROM (\n"
                + "                SELECT ROW_NUMBER()\n"
                + "                OVER(ORDER BY id) as Number,\n"
                + "                * FROM Gallery             \n"
                + "                ) as DataSearch where Number between ? and ?";

        try {   
            con = db.getConnection();
            int articleFrom = (pageCurrent - 1) * numberArticleInPage + 1;
            int articleTo = pageCurrent * numberArticleInPage;
            ps = con.prepareStatement(sql);
            ps.setInt(1, articleFrom);
            ps.setInt(2, articleTo);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery ga = new Gallery();
                ga.setId(rs.getInt("id"));
                ga.setTitle(rs.getString("title"));
                ga.setMainImage(db.getResource() + rs.getString("main_image"));
                ga.setContent(rs.getString("content"));
                listGallery.add(ga);
            }
            return listGallery;
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    public int getNumberPage(int numberArticleInPage) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(id) as countPage FROM Gallery";
        try {
        
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int numberGallery = rs.getInt("countPage");
                return numberGallery % numberArticleInPage == 0 ? (numberGallery / numberArticleInPage) : (numberGallery / numberArticleInPage) + 1;
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return -1;
    }

    public Gallery getGalleryById(int id, int numberArticleInPage, int pageCurrent) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement get_gallery = null;
        ResultSet rs = null;
        PreparedStatement get_image = null;
        ResultSet rs1 = null;
        Gallery ga = new Gallery();
        ArrayList<Image> listImage = new ArrayList<>();

        try {
     
            con = db.getConnection();
            String sql_getGallery = "SELECT [id]\n"
                    + "      ,[title]\n"
                    + "      ,[content]\n"
                    + "      ,[main_image]\n"
                    + "  FROM [dbo].[Gallery]\n"
                    + "  WHERE id = ?";
            String sql_getImage = "SELECT * FROM (\n"
                    + "			SELECT ROW_NUMBER() OVER(ORDER BY id) as Number, image_source\n"
                    + "			FROM Image WHERE gallery_id = ?\n"
                    + "			)as dataSearch where Number between ? and ?";
//            get gallery
            get_gallery = con.prepareStatement(sql_getGallery);
            get_gallery.setInt(1, id);
            rs = get_gallery.executeQuery();
            if (rs.next()) {
                ga.setId(rs.getInt("id"));
                ga.setTitle(rs.getString("title"));
                ga.setMainImage(db.getResource() + rs.getString("main_image"));
                ga.setContent(rs.getString("content"));
            }
//            get image
            get_image = con.prepareStatement(sql_getImage);
            get_image.setInt(1, id);
            int articleFrom = (pageCurrent - 1) * numberArticleInPage + 1;
            int articleTo = pageCurrent * numberArticleInPage;
            get_image.setInt(2, articleFrom);
            get_image.setInt(3, articleTo);
            rs1 = get_image.executeQuery();
            while (rs1.next()) {
                Image i = new Image();
                i.setSource(db.getResource() + rs1.getString("image_source"));
                listImage.add(i);
            }
            ga.setListImage(listImage);
        } catch (SQLException e) {
            throw e;
        } finally {
            db.closeConnection(con, get_image, rs1);
            db.closeConnection(con, get_gallery, rs);   
        }
        return ga;
    }

    public int getNumberPageImage(int id, int numberImageInPage) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(id) as count FROM Image WHERE gallery_id = ?";
        try {
        
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int numberImage = rs.getInt("count");
                return numberImage % numberImageInPage == 0 ? (numberImage / numberImageInPage) : (numberImage / numberImageInPage) + 1;
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return -1;
    }

    public ArrayList<Gallery> getTopThree() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Gallery> listGallery = new ArrayList<>();
        String sql = "SELECT TOP (3) [id], [title]\n"
                + "  FROM [Photographer].[dbo].[Gallery]";
        try {
         
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery ga = new Gallery();
                ga.setId(rs.getInt("id"));
                ga.setTitle(rs.getString("title"));
                listGallery.add(ga);
            }
            return listGallery;
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
