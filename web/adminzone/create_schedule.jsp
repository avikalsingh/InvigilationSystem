<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("userid")==null) {
        response.sendRedirect("../login.jsp");
    }
    else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
    <body onload="moveSlider()">
        <div id="outer">
            <div id="header">
                <div id="logo">
                          <img src="../images/logo2.png" >
                </div>
                <div id="title">
                    Invigilation System
                </div>
                </div>
            <div id="menu">
                <ul>
                    
                    <li> <a href="adminhome.jsp">Home</a></li>
                    <li id="active"><a href="registration.jsp">Registration</a></li>
                </ul>
            </div>
            <div id="main">
                    <form action="admincode/exam_date_code.jsp" method="post">
                        <h1 style="color:black; text-align: center">Create Schedule
                        </h1>
                        <table style="width: 70%; margin: 0 auto;">
                            <tr>
                                <td>Enter Exam Name</td>
                                <td>
                                    <input  id="input-box" type="text" name="exam_name" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>Starting Date </td>
                                <td>
                                    <input  id="input-box"  type="date" name="sdate" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>Ending Date </td>
                                <td>
                                    <input  id="input-box"  type="date" name="edate" required/>
                                </td>
                            </tr>
                             <tr>
                                <td>&nbsp</td>
                                <td>
                                    <input  id="input-box" type="Submit" value="Next"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div id="footer">
                <div id="lfooter">
                    Copyright &COPY; to Invigilation System
                </div>
                <div id="rfooter">
                    Developed By: Kartik Vashishtha
                </div>
            </div>
            </div>
            
        </div>
    </body>
</html>
<% } %>