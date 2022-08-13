<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%
    //Recieve the values of enquiry.jsp page
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
        
    //Creating Object of DbManager Class
    DbManager db = new DbManager(); //It calls the constructor
    String query = "select password from adminlogin where userid='"+userid+"'";
    ResultSet rs = db.selectData(query);
    
    if (rs.next()){
        String respassword = rs.getString(1);
        if(password.equals(respassword)) {
            session.setAttribute("userid", userid);
            response.sendRedirect("../adminzone/adminhome.jsp");
        }
        else {
            out.print("<script>alert('Invalid user');window.location.href='../login.jsp';</script>");
        }
    }
    else {
        out.print("<script>alert('User Id does not exist');window.location.href='../login.jsp';</script>");
    }
%>
