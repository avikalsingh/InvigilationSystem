<%
    session.invalidate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out</title>
        <script>
            function logout(){
                window.history.forward();
                window.setTimeout("window.location.href='../login.jsp';",1000);
            }
        </script>
    </head>
    <body style="background-image: linear-gradient(to bottom right, #330066, #00cccc); background-size: cover; padding-top: 15%; padding-bottom: 23%; overflow-y: hidden" onload="logout()">
    <center>
        <h1 style="color: white; font-family: 'Ubuntu'"></h1>
        <div class="loader"></div>
        <style>
           .loader:before {
               font-family: "Ubuntu",sans-serif;
               color: white;
               font-size: 80px;
               content: '';
               animation: animate infinite 4s;
               }
               @keyframes animate{
                   0%{
                       content: 'Logging Out.';
                   }
                   20%{
                       content: 'Logging Out..';
                   }
                   40%{
                       content: 'Logging Out...';
                   }
                   60%{
                       content: 'Logging Out....';
                   }
                   80%{
                       content: 'Logging Out.....';
                   }
                   100%{
                       content: 'Logging Out......';
                   }
               }
           
            /*border: 5px solid #009999;
            border-radius: 100%;
            border-top: 5px solid white;
            width: 80px;
            height: 80px;
            -webkit-animation: spin 2s linear infinite; /* Safari 
            animation: spin 2s linear infinite;
            }*/

            /* Safari */
            /*@-webkit-keyframes spin {
              0% { -webkit-transform: rotate(0deg); }
              100% { -webkit-transform: rotate(360deg); }
            }*/

            /*@keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }*/
        </style>
    </center>
    </body>
</html>