<%@page import="Connect.DbManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    //Code to add new notification
    String notificationtext = request.getParameter("notificationtext");
    Date dt = new Date();
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    String notificationdate = df.format(dt);
    DbManager db = new DbManager();
    String query = "insert into notification(notificationtext,notificationdate) values('"+notificationtext+"','"+notificationdate+"')";
    
    boolean res = db.insertUpdateDelete(query);
    if(res==true) {
        out.print("<script>alert('Notification is added');window.location.href='../adminhome.jsp';</script>");
    }
    else {
        out.print("<script>alert('Notification is not added');window.location.href='../adminhome.jsp';</script>");
    }
%>