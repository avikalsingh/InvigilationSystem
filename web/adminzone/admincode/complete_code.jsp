<%@page import="Connect.DbManager"%>
<%
 String exam = request.getParameter("exam_name");
    String sdate = request.getParameter("sdate");
    String edate = request.getParameter("edate");
    
    DbManager db = new DbManager();
      String query = "insert into exam_date(exam, sdate, edate, isCompleted) values('" + exam + "','"+ sdate +"','"+ edate +"',"+ 0 +")";
    boolean res = db.insertUpdateDelete(query);
    if (res == true) 
    {
        out.print("<script>window.location.href='../view_schedule.jsp';</script>");
    } 
    else 
    {
        out.print("<script>alert('Entry not done');window.location.href='../complete_schedule.jsp';</script>");
    }

%>

