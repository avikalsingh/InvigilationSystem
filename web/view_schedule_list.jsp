<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Open Schedule</title>
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
    <body onload="moveSlider()">
        <div id="outer">
            <div id="header">
                <div id="logo">
                    <img src="images/logo2.png" >
                </div>
                <div id="title">
                    Invigilation System
                </div>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li id="active"><a href="view_schedule_list.jsp">Exam Schedule</a></li>
                    <!--<li><a href="forum.jsp">QA Forum</a></li>-->
                    <li><a href="login.jsp">Admin Login</a></li>
                    <%--li><a href="enquiry.jsp">Enquiry</a></li--%>
                </ul>
            </div>
            <div id="main">
                <h1 style="color:black; text-align: center">Open Schedule</h1>
                <%
                String iscomplete = request.getParameter("iscomplete");
                if(iscomplete == null) iscomplete = "";
                    DbManager db = new DbManager();
                    String query = "select * from exam_date where isCompleted=1";
                    ResultSet rs = db.selectData(query);
                    while(rs.next()) {
                %>
                <table id="para" style="width: 60%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 1%; background-color: beige">
                <tr>
                    <td style="text-align: center"><a href="view_schedule.jsp?eid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a><br>
                    </td>
                    <% } %>
                </tr>
                </table>
            </div>
            <div id="footer">
                <div id="lfooter">
                    Copyright &COPY; to Invigilation System
                </div>
                <div id="rfooter">
                    Developed By: Group A
                </div>
            </div>
        </div>
    </body>
</html>
