<%-- 
    Document   : viewProfiles
    Created on : Dec 27, 2025, 7:27:47 PM
    Author     : adlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All profiles</title>
    </head>
    <body>
        <h1>All Student Profiles</h1>
        
        <form method="get">
            Search (Name/Student ID):
            <input type="text" name="keyword">
            <input type="submit" value="Search">                   
        </form>
        
        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Program</th>
                <th>Email</th>
                <th>Hobbies</th>
            </tr>
            
            <%
                PreparedStatement stmt; 
                
                String keyword = request.getParameter("keyword");
                
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles","adm", "adm");
                
                if(keyword != null && !keyword.isEmpty()){
                    
                    String query = "SELECT * FROM profile WHERE studName LIKE ? OR studID LIKE ?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, "%" + keyword + "%");
                    stmt.setString(2, "%" + keyword + "%");
                }else{
                    String query = "SELECT * FROM profile";
                    stmt = conn.prepareStatement(query);
                }

                ResultSet rs = stmt.executeQuery();
                
                while(rs.next()){
                    int id = rs.getInt("id");
            %>
            <tr>
                <td><%= rs.getString("studID")%></td>
                <td><%= rs.getString("studName")%></td>
                <td><%= rs.getString("program")%></td>
                <td><%= rs.getString("email")%></td>
                <td><%= rs.getString("hobbies")%></td>
                
                <td>
                    <a href="deleteProfile.jsp?id=<%= id%>">Delete</a>
                </td>
            </tr>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            %>
        </table>
    </body>
</html>
