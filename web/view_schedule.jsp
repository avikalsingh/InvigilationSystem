<%@page import="java.sql.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Connect.DbManager"%>
<%@ page language="java" import="java.util.*,java.lang.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Schedule</title>
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/slider.js" type="text/javascript"></script>
    </head>
    <body onload="moveSlider()">
        <div id="outer">
            <div id="header">
                <div id="logo">
                    <img src="images/logo2.png" >
                </div>
                <div id="title">
                    Invigilation System
                </div>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="view_schedule_list.jsp">Exam Schedule</a></li>
                    <!--<li><a href="forum.jsp">QA Forum</a></li>-->
                    <li><a href="login.jsp">Admin Login</a></li>
                    <%--li><a href="enquiry.jsp">Enquiry</a></li--%>
                </ul>
            </div>
            <div id="main">
            <%  
                class Data{
                    public String date;
                    public int shift;
                    
                    Data(String s, int sh){
                        date = s;
                        shift = sh;
                    }
                    
                    public String toString(){
                        return date;
                    }
                }
                
                String eid = request.getParameter("eid");
                DbManager db = new DbManager();
                String query = "select * from exam_date where eid="+eid+";";
                ResultSet rs = db.selectData(query);      
                String sdate="", edate="", exam="";
                
                while(rs.next()){
                    sdate = rs.getString("sdate");
                    edate = rs.getString("edate");
                    exam = rs.getString("exam");
                }
                LocalDate sd = Date.valueOf(sdate).toLocalDate();
                LocalDate ed = Date.valueOf(edate).toLocalDate();
                long day = ChronoUnit.DAYS.between(sd, ed);
                
                query = "SELECT COUNT(*) AS c FROM schedule WHERE sid="+eid+" AND examOrHol != 'Holiday';";
                rs = db.selectData(query);
                
                int exam_count = 0;
                while(rs.next()){
                    exam_count = rs.getInt("c");
                }
                
                List<Data> l = new ArrayList();
                query = "SELECT date AS d, shift AS sh FROM schedule WHERE sid="+eid+" AND examOrHol != 'Holiday';";
                rs = db.selectData(query);
                
                String dt = "";
                int sh = 0;
                Set<String> dates = new HashSet<>();
                while(rs.next()){
                    dt = rs.getString("d");
                    sh = rs.getInt("sh");
                    l.add(new Data(dt, sh));
                    dates.add(dt);
                }
                
                query = "select COUNT(*) as c from employee_db;";
                rs = db.selectData(query);
                
                int teacher_count = 0;
                while(rs.next()){
                    teacher_count = rs.getInt("c");
                    
                }
                
                
                int isgenerated = 0;
                query = "select isGenerated FROM exam_date WHERE eid="+eid+";";
                rs = db.selectData(query);
                while(rs.next()){
                    isgenerated = rs.getInt("isGenerated");
                    
                }
                
                if(isgenerated==0){
                    boolean flag;
                    while(true){
                        Collections.shuffle(l);
                        flag = true;
                        if(exam_count < teacher_count){
                            break;
                        }
                        else{
                            int round = exam_count / teacher_count;
                            for(int i = 0; i < teacher_count; i++){
                                Set<String> hash_Set = new HashSet<>();
                                for(int j = 0; j < round; j++){
                                    if(j * teacher_count + i < exam_count){
                                        if(!hash_Set.contains(l.get(j*teacher_count + i)))
                                            hash_Set.add(l.get(j*teacher_count + i).toString());
                                        else{
                                            flag = false;
                                            break;
                                        }
                                    }
                                }
                                if(!flag) break;
                            }
                            if(flag) break;
                        }
                    }
                }
                
                int j = 1;
                if(isgenerated==0){
                    for(int i = 0; i < exam_count; i++){
                        query = "UPDATE schedule SET teacher1 = " + j + " WHERE date='"+l.get(i).date+"' AND shift = " + l.get(i).shift +";";
                        db.insertUpdateDelete(query);
                        j++;
                        if(j > teacher_count) j = 1;
                        query = "UPDATE schedule SET teacher2 = " + j + " WHERE date='"+l.get(i).date+"' AND shift = " + l.get(i).shift +";";
                        db.insertUpdateDelete(query);
                        j++;
                        if(j > teacher_count) j = 1;
                        
                    }
                
                    int no_of_class = 0;
                    query = "SELECT COUNT(*) as c FROM classroom_db";
                    rs = db.selectData(query);
                    while(rs.next()){
                        no_of_class = rs.getInt("c");
                    }
                    
                    int c = 1;
                    for(String s : dates){
                        query = "UPDATE schedule SET room_no = " + c + " WHERE date = '" + s + "';";
                        db.insertUpdateDelete(query);
                        c++;
                        if(c > no_of_class) c = 1;
                    }
                    
                    query = "UPDATE exam_date SET isGenerated = 1 WHERE eid="+eid+";";
                    db.insertUpdateDelete(query);
                }
            %>
            <div style="overflow: scroll">
            <table border=2 style="width: 70%; margin: 0 auto; overflow-x: scroll; overflow-y: scroll; text-align: center">  
                <tr>
                    <th colspan="8">Duty Chart</th>
                </tr>
                <tr>
                    <th colspan="8">Exam: <% out.print(exam); %></th>
                </tr>
                <tr>
                    <th>Date</th>
                    <th>Subject</th>
                    <th>Shift</th>
                    <th>Timing</th>
                    <th>Teacher 1</th>
                    <th>Teacher 2</th>
                    <th>Classroom</th>
                    <th>Issue</th>
                </tr>
                <% 
                    ResultSet rs1 = db.selectData("select * from schedule where sid='"+ eid + "' ORDER BY date;");
                    while(rs1.next()) {
                %>
                <tr>
                    <td><%=rs1.getString("date")%></td>
                    <td><%=rs1.getString("subject")%></td>
                    <td><%=rs1.getString("shift")%></td>
                    <td><%=rs1.getString("stime")%></td>
                    <td>
                        <%  
                            int id = rs1.getInt("teacher1");
                            String q = "SELECT Name FROM employee_db WHERE Emp_ID = "+ id +";";
                            ResultSet rs2 = db.selectData(q);
                            while(rs2.next())
                                out.println(rs2.getString("Name"));
                        %>
                    </td>
                    <td>
                        <%  
                            id = rs1.getInt("teacher2");
                            q = "SELECT Name FROM employee_db WHERE Emp_ID = "+ id +";";
                            rs2 = db.selectData(q);
                            while(rs2.next())
                                out.println(rs2.getString("Name"));
                        %>
                    </td>
                    <td>
                        <%
                            int cls_no = rs1.getInt("room_no");
                            q = "SELECT classroom FROM classroom_db WHERE cid= "+ cls_no +";";
                            rs2 = db.selectData(q);
                            while(rs2.next())
                                out.println(rs2.getString("classroom"));
                        %>
                    </td>
                    <td>
                        <button type="submit">
                            <a href="issueForm.jsp?t1=<%=rs1.getInt("teacher1")%>&t2=<%=rs1.getInt("teacher2")%>&date=<%=rs1.getString("date")%>&shift=<%=rs1.getString("shift")%>">Issue</a>
                        </button>
                    </td>
                </tr>
                <% } %>
            </table>
            </div>
        </div>   
        <div id="footer">
            <div id="lfooter">
                Copyright &COPY; to Invigilation System
            </div>
            <div id="rfooter">
                Developed By: Group A
            </div>
        </div>
        </div>
    </body>  
</html>  