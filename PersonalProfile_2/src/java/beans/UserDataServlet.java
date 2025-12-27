package beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(urlPatterns = {"/UserDataServlet"})
public class UserDataServlet extends HttpServlet {
    
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //this is to retrive data
        String studentID = request.getParameter("studID");
        String name = request.getParameter("studName");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");
        
                        
        ProfileBean profile = new ProfileBean();
        profile.setStudID(studentID);
        profile.setStudName(name);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);
        
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentProfiles","adm","adm");
            String query = "INSERT INTO PROFILE (STUDID,STUDNAME,PROGRAM,EMAIL,HOBBIES,INTRO) VALUES (?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            
            stmt.setString(1, profile.getStudID());
            stmt.setString(2, profile.getStudName());
            stmt.setString(3, profile.getProgram());
            stmt.setString(4, profile.getEmail());
            stmt.setString(5, profile.getHobbies());
            stmt.setString(6, profile.getIntro());
            
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            request.setAttribute("profile", profile);
            RequestDispatcher RD = request.getRequestDispatcher("profile.jsp");
            RD.forward(request, response);
        
        }catch (Exception e) {
        e.printStackTrace();
        response.setContentType("text/html");
        response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");

            
        }   
    }   
}
