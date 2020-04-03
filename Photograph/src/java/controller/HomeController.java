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
public class HomeController extends HttpServlet {

    final int numberItemInPage = 3;
    GalleryDAO gdao = null;
    InfoDAO idao = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        try {
            gdao = new GalleryDAO();
            idao = new InfoDAO();
            request.setAttribute("listGallery", gdao.getListGallerySearch(numberItemInPage, page));
            request.setAttribute("numberPage", gdao.getNumberPage(numberItemInPage));
            request.setAttribute("info", idao.getInfo());
            request.setAttribute("page", page);
            request.setAttribute("topThree", gdao.getTopThree());
            request.setAttribute("linkActive", "home");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
