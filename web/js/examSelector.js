 function examOrHoliday(s) {
    var id = s.id;
    var value = s.value;
    console.log(id);

    var inp_sub = "select-drop-subject-" + id;
    var inp_stime = "select-drop-stime-" + id;
    var inp_etime = "select-drop-etime-" + id;
    var inp_shift = "select-drop-shift-" + id;

    if(value === "Holiday"){
        document.getElementById(inp_sub).disabled = true;
        document.getElementById(inp_stime).disabled = true;
        document.getElementById(inp_etime).disabled = true;
        document.getElementById(inp_shift).disabled = true;
    }
    else{
        document.getElementById(inp_sub).disabled = false;
        document.getElementById(inp_stime).disabled = false;
        document.getElementById(inp_etime).disabled = false;
        document.getElementById(inp_shift).disabled = false;
    }
};

function shiftAssign(s) {
    var select = s.parentNode.parentNode.children[4].children[0];
    var val = s.value;
    var arr = select.children;
    
    var len = arr.length;
    for(var i = 1; i < len; i++){
        arr[1].remove();
    }
    
    if(val === "1"){
        m_shift = ["9am-10am", "10am-11am", "10am-1pm", "11am-12pm"];
        for(var i = 0; i < m_shift.length; i++){
            var obj = document.createElement("option");
            obj.innerText = m_shift[i];
            select.appendChild(obj);
        }
    }
    else if(val === "2"){
        e_shift = ["12pm-1pm", "1pm-2pm", "2pm-3pm", "2pm-5pm", "3pm-4pm", "4pm-5pm"];
        for(var i = 0; i < e_shift.length; i++){
            var obj = document.createElement("option");
            obj.innerText = e_shift[i];
            select.appendChild(obj);
        }
    }
};

function handleSubmit() {
    var inp_sid = "sid";
    var inp_date = "select-drop-date-";
    var inp_examOrHol = "examOrHol";
    var inp_sub = "select-drop-subject-";
    var inp_stime = "select-drop-stime-";
    var inp_etime = "select-drop-etime-";
    var inp_shift = "select-drop-shift-";
    
    var inp_sid_obj = document.getElementsByClassName("sid");
    var inp_date_obj = document.getElementsByClassName("select-drop-date-");
    var inp_examOrHol_obj = document.getElementsByClassName("examOrHol");
    var inp_sub_obj = document.getElementsByClassName("select-drop-subject-");
    var inp_stime_obj = document.getElementsByClassName("select-drop-stime-");
    var inp_etime_obj = document.getElementsByClassName("select-drop-etime-");
    var inp_shift_obj = document.getElementsByClassName("select-drop-shift-");
    
    j_object = [];
    
    var len = inp_sid_obj.length;
    
    for(var i = 0; i < len; i++){
        if(inp_examOrHol_obj[i].value === 'Holiday'){ 
            j_object.push({
                'sid' : inp_sid_obj[i].value,
                'date' : inp_date_obj[i].value,
                'examOrHol' : inp_examOrHol_obj[i].value,
                'subject' : "qwe",
                'stime' : "00:00",
                'etime' : "00:00",
                'shift' : "0"
            });
        }
        else if(inp_examOrHol_obj[i].value === 'Exam'){
            j_object.push({
                'sid' : inp_sid_obj[i].value,
                'date' : inp_date_obj[i].value,
                'examOrHol' : inp_examOrHol_obj[i].value,
                'subject' : inp_sub_obj[i].value,
                'stime' : inp_stime_obj[i].value,
                'etime' : inp_etime_obj[i].value,
                'shift' : inp_shift_obj[i].value
            });
        }
        else {
             window.status("404");
        }
    }
    console.log(j_object);
    $.ajax({
    url: '../adminzone/admincode/schedule_date_code.jsp',
    dataType: 'json',
    type: 'post',
    contentType: 'application/json',
    data: JSON.stringify(j_object),
    processData: false,
    success: function( data, textStatus, errorThrown ){
        console.log(data);
        console.log(textStatus);
        window.location.replace('../view_schedule_list.jsp?iscomplete=1');
    },
    error: function( data, textStatus, errorThrown ){
        console.log(data);
        console.log(textStatus);
        window.alert('Incorrect Data Entered !');
    }
});
    
//    var xhr = new XMLHttpRequest();
//    var url = "../adminzone/admincode/schedule_date_code.jsp";
//    xhr.open("POST", url, true);
//    xhr.setRequestHeader("Content-Type", "application/json");
//    var data = JSON.stringify({'data' : j_object});
//    xhr.send(data);
//    
//    event.preventDefault();
//    const data = new FormData(event.target);
//    const value = Object.fromEntries(data.entries());
//    value.topics = data.getAll("sid");
//    value.topics = data.getAll("examOrHol");
//    value.topics = data.getAll("subject");
//    value.topics = data.getAll("shift");
//    value.topics = data.getAll("stime");
//    value.topics = data.getAll("etime");
    
  }

//  const form = document.querySelector("exam-form");
//  form.addEventListener("submit", handleSubmit);