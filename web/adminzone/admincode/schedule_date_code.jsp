<%@page import="java.io.IOException"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Connect.DbManager"%>
<%
    StringBuffer jb = new StringBuffer();
    String line = null;
    DbManager db = new DbManager();
    try {
      BufferedReader reader = request.getReader();
      while ((line = reader.readLine()) != null)
          jb.append(line);
    } 
    catch (Exception e) { /*report an error*/ }
    
    try {
        JSONArray array = new JSONArray(jb.toString()); 
        int len = array.length();
        String sid_ ="";
        for(int i = 0; i < len; i++){
            JSONObject jobj = array.getJSONObject(i);
            String date = jobj.getString("date");
            String sid = jobj.getString("sid");
            sid_ = sid;
            String examOrHol = jobj.getString("examOrHol");
            String subject = jobj.getString("subject");
            String stime = jobj.getString("stime");
            String etime = jobj.getString("etime");
            String shift = jobj.getString("shift");
            
            String query = "";
            if(!examOrHol.equals("Holiday")){
                query = "insert into schedule(sid, examOrHol, date, subject, shift, stime, etime) values('" + sid + "','"+ examOrHol +"','" + date + "','"+ subject +"','"+ shift +"','"+ stime +"','"+ etime +"')";
            }
            else{
                query = "insert into schedule(sid, examOrHol, date) values('"+ sid + "','"+ examOrHol +"','" + date  + "')";
            }
            
            boolean res = db.insertUpdateDelete(query);
            if (res == true) {}
            else {
                throw new Exception();
            }      
        }
        db.insertUpdateDelete("update exam_date set isCompleted=1 where eid='"+ sid_ + "'");
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        response.setStatus(200);
        response.getWriter().write("200");
    } 
    catch (Exception e) {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        response.setStatus(404);
        response.getWriter().write("404");
        
    }
%>