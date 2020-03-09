<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="rightContainer">
            <!--The most recent news-->
            <div>
                <p class="titleOnTop">Digital News</p>
                <p>${mostRecentArticle.description}</p>
            </div>
            <!--Search news by new title-->
            <div>
                <p class="titleMiddle">Search</p>
                <form class="flex" method="POST" action="Search">
                    <input type="text" class="search" name="keyword">
                    <input type="submit" class="buttonSearch" value="Go">
                </form>
            </div>
            <!--Top 5 most recent news-->
            <div>
                <p class="titleMiddle">Last Articles</p>
                <ul class="list-reset">
                    <c:forEach var="article" items="${fiveRecentAticle}">
                        <li class="mt-5"><a href="detail?id=${article.id}" class="listArticle">${article.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </body>
</html>
