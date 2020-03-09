<%-- 
    Document   : userInfo
   Created on : Wed 21, 2020, 03:40:28 PM
    Author     : vietvkhe130358
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Entity.QuizHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("user");
    String type = "";
    int raw_type = (Integer) session.getAttribute("userType");
    if (raw_type == 0) {
        type = "student";
    } else {
        type = "teacher";
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/common.css">
        <title>User Info</title>
    </head>
    <body>
        <h1>User Information</h1>
        User name: <%=userName%><br>
        Type: <%=type%>
    </body>
</html>
