<%-- 
    Document   : viewProfiles
    Created on : Dec 27, 2025, 7:27:47 PM
    Author     : adlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="beans.ProfileBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All profiles</title>
        
        <style>

            body {
                font-family: Arial, sans-serif;
                background: #CFECEC;
                padding: 30px;
            }

            .top-border {
                background: #045D5D;
                color: white;
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                padding: 30px;
                width: 90%;
                margin: auto;
                border-radius: 10px;
                box-shadow: 0 0 10px #2C3539;
            }

            .search-box {
                background: azure;
                padding: 20px;
                width: 80%;
                margin: 20px auto;
                border-radius: 10px;
                box-shadow: 0 0 10px #2C3539;
            }

            input[type="text"] {
                width: 70%;
                padding: 8px;
                margin-right: 10px;
                border-radius: 5px;
                border: 1px solid black;
            }

            input[type="submit"] {
                padding: 8px 16px;
                border-radius: 5px;
                border: none;
                background: #77BFC7;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background: #008B8B;
            }
            
            h1{
                text-align: center;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                background: azure;
                box-shadow: 0 0 10px #2C3539;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background: #045D5D;
                color: white;
            }

            a.delete-link {
                color: white;
                background: #D9534F;
                padding: 5px 10px;
                text-decoration: none;
                border-radius: 5px;
            }

            a.delete-link:hover {
                background: #C9302C;
            }
        </style>
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
                    String studID = rs.getString("studID");
            %>
            <tr>
                <td><%= rs.getString("studID")%></td>
                <td><%= rs.getString("studName")%></td>
                <td><%= rs.getString("program")%></td>
                <td><%= rs.getString("email")%></td>
                <td><%= rs.getString("hobbies")%></td>
                
                <td>
                    <a href="deleteProfile.jsp?studID=<%= studID %>">Delete</a>
                    
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
