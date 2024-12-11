<%
String message = "";
if (request.getParameter("status") != null) {
    String status = request.getParameter("status");
    
    if(status.equals("1")){
    	message = "Registration Successfull!";
    }else if(status.equals("0")){
    	message = "Error Occured!";
    }else if(status.equals("2")){
    	message = "Succesfully Deleted the Employee!";
    }else if(status.equals("3")){
    	message = "Error Occured!";
    }
}
%>

<%=message %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">

<style>
    .content{
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        height: 100vh;
    }
    .inner-content{
        border: 1px solid black;
        border-radius: 10px;
        padding: 20px;
        
    }
    form input{
        border: 1px solid black;
        background-color: #fff;
        border-radius: 3px;
    }
    form input,label{
        margin: 5px;
    }
</style>

</head>
<body>
<div class="content">
 <div class="inner-content">
   
<form action="save-employee">
 <table>
   <tr>
    <td><label>Employee ID</label></td>
    <td><input type="text" name="empid" /></td>
   </tr>
   
   <tr>
    <td><label>First Name</label></td>
    <td><input type="text" name="fname" /></td>
   </tr>
   
   <tr>
    <td><label>Last Name</label></td>
    <td><input type="text" name="lname" /></td>
   </tr>
   
   <tr>
    <td></td>
    <td><input type="submit" value="Register" /></td>
   </tr>
 </table>
</form>
<a href="view-employee">View Employee</a>
 </div>
</div>


</body>
</html>
