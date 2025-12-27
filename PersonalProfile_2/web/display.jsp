<%-- 
    Document   : display
    Created on : Nov 20, 2025, 11:53:06 PM
    Author     : adlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.ProfileBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Profiles</title>
        
        <style>
            body {
                font-family: Arial;
                background: #CFECEC;
                padding: 30px;
            }
            .top-border {
                background: #045D5D;
                color: white;
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                padding: 30px;
                width: 438px;
                margin: auto;
                border-radius: 10px;
                box-shadow: 0 0 10px  #2C3539;
            }
            .form-box {
                background: azure;
                padding: 50px;
                width: 400px;
                margin: auto;
                border-radius: 10px;
                box-shadow: 0 0 10px  #2C3539;
            }
            .pic{
                width: 120px;
                height: 115px;
                margin: 0 auto;
                display : block;
            }
            
            
            
        </style>
    </head>
    
    <body>
      
        <div class="top-border">Personal Information</div>
            
        <div class="form-box">
            
            <img class="pic" src="images/user_profile.png">
            
            <p>Hello! My name is,</p>
            <h2>${name}</h2>
            <br>
            <p><span><b>Student ID:</b></span> ${studentID}</p>
            <p><span><b>Program:</b></span> ${program}</p>
            <p><span><b>Email:</b></span> ${email}</p>
            <br>
            <p class = "section-hobbies"><b>Hobbies:</b></p>
            <p>${hobbies}</p>
            <br>
            <p class = "section-intro"><b>Self Introduction:</b></p>
            <p>${intro}</p>
                
        </div>
    </body>
</html>
