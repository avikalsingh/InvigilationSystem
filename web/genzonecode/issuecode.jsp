<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%
    //Recieve the values of enquiry.jsp page
    String tname = request.getParameter("teacher");
    String reason = request.getParameter("reason");
    String shift = request.getParameter("shift");
    String date = request.getParameter("date");
    
    //Creating Object of DbManager Class
    DbManager db = new DbManager(); //It calls the constructor
    String query = "insert into issue_db(eid, shift, date, reason) values(" + tname + ","+ shift + ",'" + date + "','" + reason +"')";
//    out.println(query);
    boolean res = db.insertUpdateDelete(query);
    if (res == true) 
    {
        out.print("<script>alert('Issue sent');window.location.href='../view_schedule_list.jsp';</script>");
    } 
    else 
    {   
        out.print("<script>alert('Issue not sent');window.location.href='../issueForm.jsp';</script>");
    }

%>
