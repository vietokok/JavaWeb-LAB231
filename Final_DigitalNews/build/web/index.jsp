<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Digital News</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./public/css/style.css" />
    </head>
    <body>        
        <div class="mainIndex">
            <%@include file="/components/header.jsp" %>
            <!--Content-->
            <div class="wrap-content">
                <div class="container flex">
                    <div class="contentIndex">
                        <p class="titleOnTop">${articleCurrent.title}</p>
                        <img
                            alt="title"
                            src="${articleCurrent.image}"
                            class="image-article"/>
                        <p>${articleCurrent.content}</p>
                        <!--clock-->
                        <div class="byAuthor"> 
                            <div class="icon1"></div>
                            <div class="icon2"></div>
                            By ${articleCurrent.author} | ${articleCurrent.getDateFormat()}
                        </div>
                    </div>
                    <%@include file="/components/right.jsp" %>
                </div>
            </div>
            <!--Footer-->
            <footer class="footer">
            </footer>
        </div>        
    </body>
</html>