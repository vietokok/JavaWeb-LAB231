<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./public/css/style.css" />
        <link rel="stylesheet" type="text/css" href="./public/css/search-page.css" />
        <title>Search</title>
    </head>
    <body>
        <div>
            <div class="mainIndex">
                <%@include file="/components/header.jsp" %>
                <!--Content-->
                <div class="wrap-content">
                    <div class="flex container">
                        <div class="contentIndex">
                            <c:choose>
                                <c:when test="${error != null}">
                                    <p class="not-found">Not found data</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="article" items="${listSearch}">
                                        <div class="article">
                                            <p class="titleOnTop">
                                                <a class="text-unblue undecoration" href="detail?id=${article.id}">${article.title}</a>
                                            </p>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <img
                                                            alt="title"
                                                            src="${article.image}"
                                                            class="image-article" style="width: 100%"/>
                                                    </td>
                                                    <td>
                                                        <p class="descriptionSearch">${article.description}</p>
                                                    </td>
                                                </tr>
                                            </table>                                        
                                        </div>
                                    </c:forEach>
                                    <div class="flex text-center">
                                        <c:forEach var="page" begin="1" end="${numberPage}">

                                            <c:if test="${pageCurrent == page}">
                                                <p class="page-current">${page}</p>
                                            </c:if>
                                            <c:if test="${pageCurrent != page}">
                                                <a href="Search?page=${page}" class="mx-2">${page}</a>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:otherwise>
                            </c:choose>                                             
                        </div>
                        <%@include file="/components/right.jsp" %>
                    </div>
                </div>
                <!--Footer-->
                <footer class="footer">
                </footer>
            </div>
        </div>
    </body>
</html>
