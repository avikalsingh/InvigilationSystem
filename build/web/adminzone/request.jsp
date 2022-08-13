<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%
    if(session.getAttribute("userid")==null) {
        response.sendRedirect("../login.jsp");
    }
    else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Zone</title>
        <link href="../css/style1.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="outer">
            <div id="header">
                <div id="logo">
                 <img src="../images/logo2.png"/>
                </div>
                <div id="title">
                    Welcome To Admin Zone
                </div>
            </div>
            <div id="menu" style='padding-bottom: 5%'>
                <ul>
                    <li><a href="adminhome.jsp">Admin Home</a></li>
                     <li><a href="create_schedule.jsp">Create</a></li>
                    <li><a href="../view_schedule_list.jsp">View</a></li>
                    <li><a href="request.jsp">Request</a></li>
                    <li><a href="registration.jsp">Teachers Registration</a></li>
                    <li><a href="bufferTeacher.jsp">Buffer Registration</a></li>
                    <li><a href="classroom.jsp">Classroom</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
            <div id="main">
                <table id="para" style="width: 80%; margin:  auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 2%; background-color: beige">
                        <tr style="font-weight: bold">
                            <td>Issue Id</td>
                            <td>Teacher</td>
                            <td>Shift</td>
                            <td>Date</td>
                            <td>Reason</td>
                            <td>&nbsp;</td>
                        </tr>
                            <%
                                DbManager db = new DbManager();
                                String query = "select * from issue_db";
                                ResultSet rs = db.selectData(query);
                                while(rs.next()) {
                            %>
                        <tr id="font">
                            <td><%=rs.getString(1)%></td>
                            <td>&nbsp;</td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td>
                                <a style="color: #99ffff" href="admincode/deleteRequest.jsp?issue_id=<%=rs.getString(1)%>">Delete</a>
                            </td>
                        </tr>
                            <% } %>
                    </table>
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
<% } %>