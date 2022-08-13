<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            DbManager db = new DbManager();
            String t1 = request.getParameter("t1");
            String t2 = request.getParameter("t2");
            String date = request.getParameter("date");
            String shift = request.getParameter("shift");
            String query = "SELECT Name FROM employee_db WHERE Emp_ID="+ t1 +";";
            ResultSet rs = db.selectData(query); 
            
            String teacher_1 = "";
            String teacher_2 = "";
            
            while(rs.next()){
                    teacher_1 = rs.getString("Name");
            }
            query = "SELECT Name FROM employee_db WHERE Emp_ID="+ t2 +";";
            rs = db.selectData(query);
            while(rs.next()){
                    teacher_2 = rs.getString("Name");
            }
        %>
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
                </ul>
            </div>
            <div id="main">
                <form action="genzonecode/issuecode.jsp" method="post">
                    <h1>Report Concern</h1>
                    <table id="para" style="width: 60%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 5%; background-color: beige">
                        <tr>
                            <td><input type="radio" id="t1" name="teacher" value="<%=t1%>">
                                <label for="t1"><%=teacher_1%></label>
                            </td>
                            <td>
                                <input type="radio" id="t2" name="teacher" value="<%=t2%>">
                                <label for="t2"><%=teacher_2%></label>
                            </td>
                        </tr>
                        <tr>
                            <td><br/></td>
                        </tr>
                        <tr>
                            <td>Enter Reason</td>
                            <td>
                                <textarea id="input-box" name="reason" required cols="40" rows="4" style="resize: none"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><br/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input id="input-box" style="font-family: 'Ubuntu', sans-serif; border-radius: 15px; font-size: 20px" type="submit" value="Submit"/>
                            </td>
                        </tr>
                    </table>
                            <input type="hidden" name="date" value="<%=date%>">
                            <input type="hidden" name="shift" value="<%=shift%>">
                </form>
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
