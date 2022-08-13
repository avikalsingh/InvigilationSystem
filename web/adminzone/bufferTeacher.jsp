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
        <title>JSP Page</title>
        <link href="../css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
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
                </ul>
            </div>
            <div id="main">
                <form action="admincode/buffregcode.jsp" method="post">
                    <h1 style="color:black; text-align: center">Buffer Teacher's Registration
                    </h1>
                    <table id="para" style="width: 50%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 2%; background-color: beige">
                        <tr>
                            <td>Enter Teacher Name</td>
                            <td>
                                <input  id="input-box" type="text" name="name" required/>
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Your Contact No. </td>
                            <td>
                                <input  id="input-box"  type="text" name="contactno" required/>
                            </td>
                        </tr>
                         <tr>
                            <td>&nbsp</td>
                            <td>
                                <input  id="input-box" type="Submit" value="Register"/>
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
    </body>
</html>
<% } %>