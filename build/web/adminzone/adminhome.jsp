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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            <div id="menu">
                <ul>
                    <li><a href="adminhome.jsp">Admin Home</a></li>
                    <li><a href="create_schedule.jsp">Create</a></li>
                    <li><a href="../view_schedule_list.jsp">View</a></li>
                    <li><a href="request.jsp">Request</a></li>
                    <li><a href="registration.jsp">Teacher's Registration</a></li>
                    <li><a href="bufferTeacher.jsp">Buffer Registration</a></li>
                    <li><a href="classroom.jsp">Classroom</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
            <div id="main">
                <h1>Manage Notifications</h1>
                <form action="admincode/addnotificationcode.jsp" method="post">
                    <table id="para" style="width: 50%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 2%; background-color: beige">
                        <tr>
                            <td>Enter Notification</td>
                            <td>
                                <textarea id="input-box" name="notificationtext" rows="5" cols="30" style="resize: none"></textarea>
                            </td>
                        </tr>
                        <td>&nbsp;</td>
                        <td>
                            <input id="input-box" style="font-family: 'Ubuntu', sans-serif; font-size: 16px; border-radius: 15px" type="submit" value="Add Notification"/>
                        </td>
                    </table>
                    <br/>
                    <table id="para" style="width: 80%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 2%; background-color: beige">
                        <tr style="font-weight: bold">
                            <td>Id</td>
                            <td>Notification</td>
                            <td>Date</td>
                            <td>&nbsp;</td>
                        </tr>
                            <%
                                DbManager db = new DbManager();
                                String query = "select * from notification";
                                ResultSet rs = db.selectData(query);
                                while(rs.next()) {
                            %>
                        <tr id="font">
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td>
                                <a style="color: #99ffff" href="admincode/deletenotification.jsp?id=<%=rs.getString(1)%>">Delete</a>
                            </td>
                        </tr>
                            <% } %>
                    </table>
                </form>
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