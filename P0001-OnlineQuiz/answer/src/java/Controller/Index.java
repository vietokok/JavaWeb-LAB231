package Controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Index extends BaseServlet {

    @Override
    public String getFileName() {
        return "userInfo.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            super.doGet(request, response);
        } catch (IOException | ServletException ex) {
            Logger.getLogger(Index.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("/errorPage/errorPage.jsp").forward(request, response);
        }
    }
}
