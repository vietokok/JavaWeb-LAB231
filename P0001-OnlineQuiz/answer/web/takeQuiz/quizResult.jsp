<%-- 
    Document   : quizResult
    Created on : Wed 21, 2020, 04:10:12 PM 
    Author     : vietvkhe130358
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int numOfQuiz = Integer.parseInt(request.getAttribute("numOfQuiz").toString());
    String result = (String) request.getAttribute("result");
    String percent = (String) request.getAttribute("percent");
    String status = (String) request.getAttribute("status");
    String className = (String) request.getAttribute("className");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/common.css">
        <title>Quiz Result</title>
    </head>
    <body>
        <p>Your score: 
            <span class="bold <%=className%>">
                <%=result%> (<%=percent%>%) - <%=status%>
            </span>
        </p>
        <form action="TakeQuiz" method="post">
            <input type="hidden" name="req" value="quizReq">
            <input id="resultText" type="hidden" name="numOfQuiz" value="<%=numOfQuiz%>">
            <br>Take another quiz 
            <input type="submit" value="Start">
        </form>
    </body>
</html>
