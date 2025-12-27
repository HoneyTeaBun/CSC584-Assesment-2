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
            
            
            String studID = (request.getParameter("studID"));
            PreparedStatement stmt = null;
            Connection conn = null;
            
            if(studID != null && !studID.isEmpty()) {
                
                try{ 
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentProfiles","adm","adm");                
                    stmt = conn.prepareStatement("DELETE FROM PROFILE WHERE STUDID = ?");

                    stmt.setString(1, studID);
                    int rows = stmt.executeUpdate();
                    out.println(rows + " row deleted.");
                } catch(Exception e){
                    out.println("Error: " + e.getMessage());
                } finally {
                    if(stmt !=null) stmt.close();
                    if(conn !=null) conn.close();

                }
            } else {
                out.println("No STUDID provided, nothing deleted.");
            }
               response.sendRedirect("viewProfiles.jsp");
        %>
    </body>
</html>
