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
                    <li id="active">   <a href="registration.jsp">Registration</a></li>
                </ul>
            </div>
            <div id="main">
                    <form action="admincode/exam_date_code.jsp" method="get">
                        <h1 style="color:black; text-align: center">Select Schedule</h1>
                        
                        <%
                        String iscomplete = request.getParameter("iscomplete");
                        if(iscomplete == null) iscomplete = "";
                        %>
                        
                        <table style="width: 70%; margin: 0 auto;">
                            <tr style="text-align: center">
                                <td><a style="color: #009999; font-size: 20px;" href="schedule_next.jsp?iscomplete=1">Complete</a></td>
                                <td><a style="color: #009999; font-size: 20px;" href="schedule_next.jsp?iscomplete=0">Incomplete</a></td>
                            </tr>
                        </table>
                            <%
                            if(iscomplete.equals("1")) {
                                DbManager db = new DbManager();
                                String query = "select * from exam_date where isCompleted=1";
                                ResultSet rs = db.selectData(query);
                                while(rs.next()) {
                            %>
                            <table style="width: 70%; margin: 0 auto;">
                            <tr>
                                <td style="text-align: center"><a href="../view_schedule.jsp?eid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a><br>
                                </td>
                                <% } %>
                            </tr>
                            </table>
                            <% } 
                            else if(iscomplete.equals("0")) { 
                                DbManager db = new DbManager();
                                String query = "select * from exam_date where isCompleted=0";
                                ResultSet rs = db.selectData(query);
                                while(rs.next()) {
                            %>
                            <table style="width: 70%; margin: 0 auto;">
                            <tr>
                                <td style="text-align: center"><a href="complete_schedule.jsp?eid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a><br></td>
                                <% } 
                            } %>
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