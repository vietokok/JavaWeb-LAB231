<%-- 
    Document   : header
    Created on : Mar 21, 2020, 10:47:42 AM
    Author     : 84963
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>       
        <link href="public/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>       
        <!-- nav-bar -->
        <div class="nav-bar">
            <div class="content-bar">
                <div class="item">
                    <a class="${linkActive=="home"?"bold-font":""}" href="home">My front page</a>
                </div>
                <c:forEach var="item" items="${topThree}">
                    <div class="item">
                        <a class="${linkActive==item.id?"bold-font":""}" href="detail?id=${item.id}">${item.title}</a>
                    </div>
                </c:forEach>                
                <div class="item">
                    <a class="${linkActive=="contact"?"bold-font":""}" href="contact">Contact</a>
                </div>
            </div>
        </div>
        <!-- end-nav-bar -->
        <!-- title -->
        <div class="title">
            <div class="title-main">
                <div class="icon">
                </div>
                <div class="text">
                    <div class="photo-link"><a href="home">PHOTOGRAPHER</a></div>
                    <div class="welcome-text">Welcome to this website</div>
                </div>
            </div>
        </div>
        <!-- end title -->        
    </body>
</html>
