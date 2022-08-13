<%@page import="Connect.DbManager"%>
<%
 String name = request.getParameter("name");
    String contactno = request.getParameter("contactno");
    
    DbManager db = new DbManager();
      String query = "insert into Employee_db(Name, Contact_No) values('" + name + "','"+ contactno +"')";
    boolean res = db.insertUpdateDelete(query);
    if (res == true) 
    {
        out.print("<script>alert('Registration is done');window.location.href='../registration.jsp';</script>");
    } 
    else 
    {
        out.print("<script>alert('Registration is not done');window.location.href='../registration.jsp';</script>");
    }

%>



