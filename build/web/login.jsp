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
                <form action="genzonecode/logcode.jsp" method="post">
                    <h1>Admin Login</h1>
                    <table id="para" style="width: 60%; margin: 0 auto; color: #009999; font-size: 20px;border-radius: 25px; padding: 5%; background-color: beige">
                        <tr>
                            <td>Enter User Id</td>
                            <td>
                                <input id="input-box" type="text" name="userid" required/>
                            </td>
                        </tr>
                        <tr>
                            <td><br/></td>
                        </tr>
                        <tr>
                            <td>Enter Password</td>
                            <td>
                                <input id="input-box" type="password" name="password" required/>
                            </td>
                        </tr>
                        <tr>
                            <td><br/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input id="input-box" style="font-family: 'Ubuntu', sans-serif; border-radius: 15px; font-size: 20px" type="submit" value="Login"/>
                            </td>
                        </tr>
                    </table>
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
