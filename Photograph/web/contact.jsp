<%-- 
    Document   : contact
    Created on : Mar 21, 2020, 10:34:48 AM
    Author     : 84963
--%>

<%@page import="entity.Photographer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <link href="public/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/contact.css" rel="stylesheet" type="text/css"/>      
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!--main content-->
        <div class="main-content">            
            <div class="content-and-share">
                <!--content-->
                <div class="content-panel">                    
                    <div class="title-content">Contact</div>
                    <div class="info-title">PHOTOGRAPHER</div>                    
                    <div class="info">
                        <div class="address">
                            <ul>
                                <li>Address:&nbsp; ${info.address}</li>
                                <li>City:&nbsp; ${info.city}</li>
                                <li>Country:&nbsp; ${info.country}</li>
                            </ul>
                        </div>
                        <div class="contact-way">
                            <p>Tel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${info.phone}</p>
                            <p>Email:&nbsp;&nbsp; ${info.email}</p>
                        </div>
                    </div>
                    <div class="image-map">
                        <img src="${info.map}">
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
