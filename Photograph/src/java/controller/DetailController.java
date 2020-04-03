package controller;

import entity.Gallery;
import entity.Image;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GalleryDAO;

/**
 *
 * @author 84963
 */
public class DetailController extends HttpServlet {

    GalleryDAO gdao = null;
    final int numberImageInAPage = 8;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int image = request.getParameter("image") == null ? 0 : Integer.parseInt(request.getParameter("image"));
        try {
            gdao = new GalleryDAO();
            String raw_id = request.getParameter("id");
            int id = Integer.parseInt(raw_id);
            Gallery ga = gdao.getGalleryById(id, numberImageInAPage, page);
            ArrayList<Image> listImage = ga.getListImage();
            if (ga.getContent() == null) {
                request.setAttribute("error", "Not data found");
            }
            int numberPage = gdao.getNumberPageImage(id, numberImageInAPage);
            request.setAttribute("galleryDetail", ga);
            request.setAttribute("listImage", listImage);
            request.setAttribute("mainImage", listImage.get(image).getSource());
            request.setAttribute("page", page);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("topThree", gdao.getTopThree());
            request.setAttribute("linkActive", id);
            request.getRequestDispatcher("detail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
