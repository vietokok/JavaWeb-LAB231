<%-- 
    Document   : error
    Created on : Mar 23, 2020, 8:50:46 AM
    Author     : 84963
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>        
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
                        An error has occurred!
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
