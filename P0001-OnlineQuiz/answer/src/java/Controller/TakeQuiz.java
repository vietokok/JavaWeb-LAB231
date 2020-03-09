package Controller;

import Model.Entity.Question;
import Model.QuestionModel;
import Model.QuizHistoryModel;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TakeQuiz extends BaseServlet {

    String page = "takeQuiz/quizPrepare.jsp";
    QuestionModel qm = null;

    @Override
    public String getFileName() {
        return "takeQuiz/quizPrepare.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String x = "INSERT INTO [dbo].[corporation]\n" +
"           ([corp_name]\n" +
"           ,[street]\n" +
"           ,[city]\n" +
"           ,[state_prov]\n" +
"           ,[country]\n" +
"           ,[mail_code]\n" +
"           ,[phone_no]\n" +
"           ,[expr_dt]\n" +
"           ,[region_no]\n" +
"           ,[corp_code])\n" +
"     VALUES\n" +
"           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            qm = new QuestionModel();
            request.setAttribute("numOfQuiz", qm.getQuestionSize());
        } catch (Exception ex) {
            Logger.getLogger(TakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("/errorPage/errorPage.jsp").forward(request, response);
        } finally {
            super.doGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String request = req.getParameter("req");
            qm = new QuestionModel();
            if (request.equals("quizPrepare")) {
                questionRequest(req, resp);
            } else if (request.equals("quizResult")) {
                questionResult(req, resp);
            }
            req.setAttribute("page", page);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(TakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            req.getRequestDispatcher("/errorPage/errorPage.jsp").forward(req, resp);
        }
    }

    public void questionRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        req.setAttribute("savedNumOfQuiz", numOfQuiz);
        if ((numOfQuiz <= 0)) {
            req.setAttribute("message", "Quiz number must be larger than 0");
            page = "takeQuiz/quizPrepare.jsp";
        } else if (numOfQuiz > qm.getQuestions().size()) {
            req.setAttribute("message", "Over quiz number in bank");
            page = "takeQuiz/quizPrepare.jsp";
        } else {
            ArrayList<Integer> questionIndexs = new ArrayList<>();
            for (int i = 0; i < qm.getQuestions().size(); i++) {
                questionIndexs.add(i);
            }
            Collections.shuffle(questionIndexs);
            ArrayList<Question> listQuestion = new ArrayList<>();
            for (int i = 0; i < numOfQuiz; i++) {
                listQuestion.add(qm.getQuestions().get(questionIndexs.get(i)));
            }
            req.setAttribute("quizData", listQuestion);
            page = "takeQuiz/quizPage.jsp";
        }
    }

    public void questionResult(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Date createTime = new Date(req.getSession().getLastAccessedTime());
        Date now = new Date();
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        if (((now.getTime() - createTime.getTime()) / 1000) > (numOfQuiz * 2 + 2)) {
            QuizHistoryModel qhm = new QuizHistoryModel();
            int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
            qhm.addEntry(userId, numOfQuiz, -1);
            String errorTakeQuiz = "errorPage/errorTakeQuiz.jsp";
            req.setAttribute("page", errorTakeQuiz);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        double mark = 0;
        for (int i = 0; i < numOfQuiz; i++) {
            int id = Integer.parseInt(req.getParameter("q" + String.valueOf(i)));
            Question question = qm.findQuestionById(id);

            String answer = "";
            for (int j = 0; j < 4; j++) {
                String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                if (req.getParameter(answerId) != null) {
                    answer += String.valueOf(j + 1);
                }
            }
            if (question.getAnswer().equals(answer)) {
                mark++;
            }
        }

        QuizHistoryModel qhm = new QuizHistoryModel();
        int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
        qhm.addEntry(userId, numOfQuiz, (int) mark);

        NumberFormat formatter = new DecimalFormat("#0.00");
        mark = (mark / (double) numOfQuiz) * 10;
        double percent = mark * 10;
        String status = "Failed";
        if (mark >= 4) {
            status = "Passed";
        }
        String className = (status.equals("Passed")) ? "success" : "failed";
        req.setAttribute("numOfQuiz", numOfQuiz);
        req.setAttribute("result", formatter.format(mark));
        req.setAttribute("percent", formatter.format(percent));
        req.setAttribute("status", status);
        req.setAttribute("className", className);
        page = "takeQuiz/quizResult.jsp";
    }

    public boolean isEmpty(String param) {
        return (param == null || param.isEmpty());
    }

    @Override
    public boolean isTeacherOnly() {
        return false;
    }
}
