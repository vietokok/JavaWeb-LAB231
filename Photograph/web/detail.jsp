<%-- 
    Document   : detail
    Created on : Mar 21, 2020, 10:34:26 AM
    Author     : 84963
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <link href="public/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/gallery.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="main-content">
            <!-- image and search -->
            <div class="content-and-share">                
                <div class="content-panel">
                    <c:choose>
                        <c:when test="${error != null}">
                            <div>${error}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="title-content">${galleryDetail.title}</div>
                            <div class="panel-img-gallery">
                                <img class="image" src="${mainImage}" />
                            </div>                
                            <div class="view-other-gallery">
                                <c:forEach var="i" begin="0" end="${listImage.size() - 1}">
                                    <div class="other-detail-panel shadow">
                                        <a href="detail?id=${galleryDetail.id}&page=${page}&image=${i}"><img class="image" src="${listImage[i].source}"/></a>
                                    </div>
                                </c:forEach>                    
                                <div class="clear"></div>
                            </div> 
                            <div class="paging">
                                <c:forEach var="i" begin="1" end="${numberPage}">
                                    <c:if test="${page == i}">
                                        <p class="current-page">${i}</p>
                                    </c:if>
                                    <c:if test="${i != page}">
                                        <a href="detail?id=${galleryDetail.id}&page=${i}" class="other-page">${i}</a>
                                    </c:if>
                                </c:forEach>                     
                            </div>
                        </c:otherwise>
                    </c:choose>                   
                </div>
                <%@include file="share.jsp" %>
            </div>
            <!-- end image and search -->
        </div>
        <!-- end main content -->
        <%@include file="footer.jsp" %>
    </body>
</html>
