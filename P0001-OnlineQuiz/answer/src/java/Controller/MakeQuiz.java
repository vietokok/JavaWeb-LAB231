package Controller;

import Model.Entity.Question;
import Model.QuestionModel;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MakeQuiz extends BaseServlet {

    @Override
    public String getFileName() {
        return "makeQuiz/makeQuiz.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            super.doGet(request, response);
        } catch (IOException | ServletException ex) {
            Logger.getLogger(MakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("/errorPage/errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QuestionModel qm = null;
        String page = getFileName();
        try {
            String answer = "";
            for (int i = 1; i <= 4; i++) {
                if (req.getParameter("ans" + i) != null) {
                    answer += String.valueOf(i);
                }
            }
            Question q = new Question(
                    -1,
                    req.getParameter("content").replaceAll(System.getProperty("line.separator"), "\n"),
                    answer,
                    new Date()
            );
            q.addOption(req.getParameter(("opt1")));
            q.addOption(req.getParameter(("opt2")));
            q.addOption(req.getParameter(("opt3")));
            q.addOption(req.getParameter(("opt4")));
            req.setAttribute("content", q.getContent());
            req.setAttribute("opt1", q.getOption().get(0));
            req.setAttribute("opt2", q.getOption().get(1));
            req.setAttribute("opt3", q.getOption().get(2));
            req.setAttribute("opt4", q.getOption().get(3));
            req.setAttribute("answer", q.getAnswer());

            int error = 0;
            if (q.getContent().equals("") || !hasCharacter(q.getContent())) {
                error = 1;
            } else if (q.getOption().get(0).equals("") || !hasCharacter(q.getOption().get(0))) {
                error = 2;
            } else if (q.getOption().get(1).equals("") || !hasCharacter(q.getOption().get(1))) {
                error = 3;
            } else if (q.getOption().get(2).equals("") || !hasCharacter(q.getOption().get(2))) {
                error = 4;
            } else if (q.getOption().get(3).equals("") || !hasCharacter(q.getOption().get(3))) {
                error = 5;
            } else if (q.getAnswer().equals("")) {
                error = 6;
            } else if (q.getAnswer().equals("1234")) {
                error = 7;
            }
            switch (error) {
                case 1:
                    req.setAttribute("message", "Question cannot be empty");
                    break;
                case 2:
                    req.setAttribute("message", "Option 1 cannot be empty");
                    break;
                case 3:
                    req.setAttribute("message", "Option 2 cannot be empty");
                    break;
                case 4:
                    req.setAttribute("message", "Option 3 cannot be empty");
                    break;
                case 5:
                    req.setAttribute("message", "Option 4 cannot be empty");
                    break;
                case 6:
                    req.setAttribute("message", "Please select answer");
                    break;
                case 7:
                    req.setAttribute("message", "Cannot select all answers");
                    break;
                default:
                    qm = new QuestionModel();
                    qm.addQueston(q);
                    page = "makeQuiz/quizAdded.jsp";
                    break;
            }
            req.setAttribute("page", page);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(MakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            req.getRequestDispatcher("/errorPage/errorPage.jsp").forward(req, resp);
        }
    }

    private boolean hasCharacter(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) != ' ') {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean isTeacherOnly() {
        return true;
    }
}
