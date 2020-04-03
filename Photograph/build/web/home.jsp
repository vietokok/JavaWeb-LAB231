<%-- 
    Document   : home
    Created on : Mar 21, 2020, 10:34:14 AM
    Author     : 84963
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Photographer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Gallery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="public/css/style.css" rel="stylesheet" type="text/css"/>       
    </head>
    <body>  
        <%@include file="header.jsp" %>
        <!--main content-->
        <div class="main-content">               
            <div class="content-and-share">
                <!--content-->
                <div class="content-panel">
                    <div>
                        <img class="image" src="${info.specialImage}" />
                    </div>
                    <div class="title-img">${info.title}</div>
                    <div class="view-gallery-panel">                        
                        <c:forEach var="gallery" items="${listGallery}">
                            <div class="gallery-item">
                                <div class="image-gallery">
                                    <img class="img-gallery" src="${gallery.mainImage}">
                                </div>
                                <div class="title-gallery">
                                    <a href="detail?id=${gallery.id}">View ${gallery.title}</a>
                                </div>
                                <div class="content-gallery">
                                    <p>${gallery.content}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="paging">
                        <c:forEach var="i" begin="1" end="${numberPage}">
                            <c:if test="${page == i}">
                                <p class="current-page">${i}</p>
                            </c:if>
                            <c:if test="${i != page}">
                                <a href="home?page=${i}" class="other-page">${i}</a>
                            </c:if>
                        </c:forEach>                     
                    </div>
                    <div class="about-me">
                        <div class="title-about">About me</div>
                        <div class="content-about">
                            ${info.aboutMe}
                        </div>
                    </div>                 
                </div>
                <!--end content-->
                <!--share-->
                <%@include file="share.jsp" %>
                <!--end share-->
            </div>           
        </div>
        <!-- end main content -->    
        <%@include file="footer.jsp" %>
    </body>
</html>
