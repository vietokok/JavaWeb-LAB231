<%-- 
    Document   : quizPrepare
    Created on : Wed 21, 2020, 02:30:50 PM
    Author     : vietvkhe130358
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("user");
    String message = (String) request.getAttribute("message");
    int savedNumOfQuiz = 0;
    if (message != null) {
        savedNumOfQuiz = Integer.parseInt(request.getAttribute("savedNumOfQuiz").toString());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/common.css">
        <title>Quiz Prepare</title>
    </head>
    <body>
        <h3>Welcome <span class="userName"><%=userName%></span></h3>
        <% if (message != null) {%>
        <span class="failed"><%=message%></span>
        <% }%>
        <form action="TakeQuiz" method="post">
            <input type="hidden" name="req" value="quizPrepare">
            <br>Enter number of question: <br>
            <input type="number" value="<%=(message != null) ? savedNumOfQuiz : "" %>" name="numOfQuiz" required>
            <input type="submit" value="Start">
        </form>
    </body>
</html>
