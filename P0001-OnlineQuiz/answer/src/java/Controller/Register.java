package Controller;

import Model.Entity.User;
import Model.UserModel;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends BaseServlet {

    @Override
    public String getFileName() {
        return "registerForm.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", getFileName());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "registerForm.jsp";
        String message = "", messageClass = "failed";
        UserModel um = null;
        try {
            um = new UserModel();
            String userName = req.getParameter("username");
            String password = req.getParameter("password");
            String type = req.getParameter("type");
            String email = req.getParameter("email");

            req.setAttribute("savedUserName", userName);
            req.setAttribute("savedEmail", email);
            req.setAttribute("savedType", Integer.parseInt(type));
            User newUser = new User(-1, userName, password, email, Integer.parseInt(type));

            int errorCode = um.validateNewUser(newUser);
            if (errorCode == 1) {
                message = "Username is already exist";
            } else if (errorCode == 2) {
                message = "Email is already exist";
            } else if (newUser.getPassword().length() < 8) {
                message = "Password must contain at least 8 character";
            } else {
                um.addUser(newUser);
                message = "User registered successfully";
                messageClass = "success";
            }
            req.setAttribute("page", page);
            req.setAttribute("message", message);
            req.setAttribute("messageClass", messageClass);
            req.getRequestDispatcher("index.jsp").forward(req, resp);

        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            req.getRequestDispatcher("/errorPage/errorPage.jsp").forward(req, resp);
        }
    }
}
