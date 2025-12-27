<%-- 
    Document   : deleteProfile
    Created on : Dec 27, 2025, 8:26:53 PM
    Author     : adlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles","adm", "adm");
            
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM profile WHERE id=?");
            
            stmt.setInt(1, id);
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            response.sendRedirect("viewProfiles.jsp");

        %>
    </body>
</html>
