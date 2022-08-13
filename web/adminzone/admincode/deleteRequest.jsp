<%@page import="Connect.DbManager"%>
<%
    
    String issue_id = request.getParameter("issue_id");
    DbManager db = new DbManager();
    String query = "delete from issue_db where issue_id='"+issue_id+"'";
    
    boolean res = db.insertUpdateDelete(query);
    if(res==true) {
        out.print("<script>alert('Issue is deleted');window.location.href='../adminhome.jsp';</script>");
    }
    else {
        out.print("<script>alert('Issue is not deleted');window.location.href='../adminhome.jsp';</script>");
    }
%>