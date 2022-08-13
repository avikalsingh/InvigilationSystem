<%@page import="Connect.DbManager"%>
<%
 String classroom = request.getParameter("class");    
    DbManager db = new DbManager();
    String query = "insert into classroom_db(classroom) values('" + classroom + "')";
    boolean res = db.insertUpdateDelete(query);
    if (res == true) 
    {
        out.print("<script>alert('Class Added');window.location.href='../classroom.jsp';</script>");
    } 
    else 
    {
        out.print("<script>alert('Class not added');window.location.href='../classroom.jsp';</script>");
    }

%>
