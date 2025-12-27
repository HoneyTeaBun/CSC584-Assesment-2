<%-- 
    Document   : profile
    Created on : Dec 27, 2025, 7:04:42 PM
    Author     : adlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ProfileBean pb = (ProfileBean) request.getAttribute("profile");
    
    if (pb == null) {
%>        
<h3>Profile is null</h3>
        

<%
    }else{
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        <h2>Profile saved successfully..</h2>
        
        <p><b>Student ID: </b> <%= pb.getStudID() %></p>
        <p><b>Name: </b> <%= pb.getStudName() %></p>
        <p><b>Program: </b> <%= pb.getProgram() %></p>
        <p><b>Email: </b> <%= pb.getEmail() %></p>
        <p><b>Hobbies: </b> <%= pb.getHobbies() %></p>
        <p><b>Intro: </b> <%= pb.getIntro() %></p>
        
        <a href="viewProfiles.jsp">View All profiles</a>
    </body>
</html>
<%
    }
%>
