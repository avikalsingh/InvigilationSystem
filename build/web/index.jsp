<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.time.LocalDate,java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lemonada:wght@300&display=swap" rel="stylesheet">
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
    <body onload="moveSlider()">
        <div id="outer">
            <div id="header">
                <div id="logo">
                    <a href="aboutus.jsp">
                    <img src="images/logo2.png"/>
                    </a>
                </div>
                <div id="title">
                    Invigilation System
                </div>
            </div> 
            <div id="menu">
                <ul>
                    <li id="active"><a href="index.jsp">Home</a></li>
                    <li><a href="view_schedule_list.jsp">Exam Schedule</a></li>
                    <!--<li><a href="forum.jsp">QA Forum</a></li>-->
                    <li><a href="login.jsp">Admin Login</a></li>
                    <%--li><a href="enquiry.jsp">Enquiry</a></li--%>
                </ul>
            </div>
            <div id="slider">
                <img id="slide" width="1000px" height="250px"/>
            </div>
            <div id="main">
                <div id="left">
                    <marquee style="border-radius: 15px; padding: 4%" direction="up" height="475px" bgcolor="beige" vspace="16%" hspace="10%" onmouseover="stop()" onmouseout="start()">
                    <%
                        DbManager db = new DbManager();
                        String query = "select * from notification";
                        ResultSet rs = db.selectData(query);
                        while(rs.next()) {
                    %>
                    <p id="para" style="border-radius: 15px; padding-top: 2%; padding-bottom: 2%; color: #009999; text-align: center; font-size: 20px"><%=rs.getString(2)%><br/><%=rs.getString(3)%></p>
                    <% } %>
                    </marquee>
                </div>
                <div id="right">
                    <br/>
                    <h1 style="font-size: 70px">Today's Duty</h1><br/><hr/>
                    <div style="padding: 4%">
                    <p id="para" style="color: #009999; text-align: center; border-radius: 15px; background-color: beige; padding: 2%; font-family: 'Lemonada', cursive">
                        <% 
                            LocalDate date = LocalDate.now();
                            query = "SELECT * FROM schedule WHERE date='" + date.toString() + "';";
                            rs = db.selectData(query);
                            while(rs.next()){
                                String t1 = rs.getString("teacher1");
                                String t2 = rs.getString("teacher2");
                                String cls = rs.getString("room_no");
                                String time = rs.getString("stime");
                                query = "SELECT Name FROM employee_db WHERE Emp_ID="+ t1 +";";
                                ResultSet rs1 = db.selectData(query); 
            
                                String teacher_1 = "";
                                String teacher_2 = "";

                                while(rs1.next()){
                                        teacher_1 = rs1.getString("Name");
                                }
                                query = "SELECT Name FROM employee_db WHERE Emp_ID="+ t2 +";";
                                rs1 = db.selectData(query);
                                while(rs1.next()){
                                        teacher_2 = rs1.getString("Name");
                                }
                                out.println(teacher_1 + "  &  " + teacher_2 + " have duty in  " + cls + " at " + time);
                            }
                        %>
                    </p>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div id="lfooter">
                    Copyright &COPY; Invigilation System
                </div>
                <div id="rfooter">
                Developed By: Group A
                </div>
            </div>
        </div>
    </body>
</html>
