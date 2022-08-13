<%@page import="java.sql.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@page import="java.time.temporal.ChronoUnit"%>
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
        <title>Complete The Schedule</title>
        <link href="../css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="../js/examSelector.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                <form id="exam-form" action="admincode/schedule_date_code.jsp" method="post">
                        <%
                        String eid = request.getParameter("eid");
                        DbManager db = new DbManager();
                        String query = "select * from exam_date where eid="+eid+";";
                        ResultSet rs = db.selectData(query);      
                        String sdate="", edate="", exam="";
                        while(rs.next()){
                            sdate = rs.getString("sdate");
                            edate = rs.getString("edate");
                            exam = rs.getString("exam");
                        }                        
                        LocalDate sd = Date.valueOf(sdate).toLocalDate();
                        LocalDate ed = Date.valueOf(edate).toLocalDate();                        
                        long day = ChronoUnit.DAYS.between(sd, ed);
                        %>
                        <h1 style="color:black; text-align: center">Exam: <% out.print(exam); %></h1>
                        <table style="width: 70%; margin: 0 auto; overflow-y: scroll; ">
                            <tr style="text-align: center">
                                <th>Date</th>
                                <th>Choose</th>
                                <th>Subject</th>
                                <th>Shift</th>
                                <th>Starting Time</th>
                                <th>Ending Time</th>
                            </tr>
                            <% for(int i=0; i < (day + 1); i++) { %>
                            <tr style="text-align: center">
                                <td>
                                    <input id="sid" type="hidden" class="sid" name="sid" value="<% out.print(eid); %>"/>
                                    <input  id="<% out.print("select-drop-date-"+i); %>" class="select-drop-date-" type="date" name="date" disabled value="<%out.print(sd.plusDays(i % (day + 1)).toString());%>" required/>
                                </td>
                                <td>
                                    <select id="<% out.print(i); %>"  class="<% out.print(i); %> examOrHol" name="examOrHol" onchange="examOrHoliday(this)" required>
                                        <option value="" disabled selected>--Select--</option>
                                        <option value="Holiday">Holiday</option>
                                        <option value="Exam">Exam</option>
                                    </select>
                                </td>
                                <td>
                                    <input id="<% out.print("select-drop-subject-"+i); %>" class="select-drop-subject-" type="text" name="subject" required/>
                                </td>
                                <td>
                                    <select id="<%out.print("select-drop-shift-"+i);%>" class="select-drop-shift-" name="shift" onchange="shiftAssign(this)" required>
                                        <option value="" disabled selected>--Select--</option>
                                        <option value="1">Morning</option>
                                        <option value="2">Afternoon</option>
                                    </select>
                                </td>
                                <td>
                                    <input id="<% out.print("select-drop-stime-"+i); %>" class="select-drop-stime-" type="time" name="stime" required/>
                                </td>
                                <td>
                                    <input id="<% out.print("select-drop-etime-"+i); %>" class="select-drop-etime-" type="time" name="etime" required/>
                                </td>
                                <!--<td>
                                    <select id="input-box" class="<% out.print("select-drop-time-" + i); %>" name="timing" required>
                                        <option value="" disabled selected>--Select--</option>
                                    </select>
                                </td>-->
                            </tr>
                            <% } %>
                            <tr style="text-align: center">   
                                <td>&nbsp</td>
                                <td>
                                    <button onclick="handleSubmit()">Save</button>
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