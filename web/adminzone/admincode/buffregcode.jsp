<%@page import="Connect.DbManager"%>
<%
 String name = request.getParameter("name");
    String contactno = request.getParameter("contactno");
    
    DbManager db = new DbManager();
      String query = "insert into buffer_teacher(Name, Contact_No) values('" + name + "','"+ contactno +"')";
    boolean res = db.insertUpdateDelete(query);
    if (res == true) 
    {
        out.print("<script>alert('Registration is done');window.location.href='../bufferTeacher.jsp';</script>");
    } 
    else 
    {
        out.print("<script>alert('Registration is not done');window.location.href='../bufferTeacher.jsp';</script>");
    }

%>



