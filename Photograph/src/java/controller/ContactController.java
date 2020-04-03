package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GalleryDAO;
import model.InfoDAO;

/**
 *
 * @author 84963
 */
public class ContactController extends HttpServlet {

    InfoDAO idao = null;
    GalleryDAO gdao = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            idao = new InfoDAO();
            gdao = new GalleryDAO();
            request.setAttribute("info", idao.getInfo());
            request.setAttribute("topThree", gdao.getTopThree());
            request.setAttribute("linkActive", "contact");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
