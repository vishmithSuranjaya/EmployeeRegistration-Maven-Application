<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="my.app.entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<%
 Employee employee =(Employee) request.getAttribute("employee");
%>
   <form>
     <table>
       <tr>
         <td>Employee ID</td>
         <td><input type="text" value="<%=employee.getEmpid() %>" readonly /></td>
       </tr>
       
       <tr>
         <td>First Name</td>
         <td><input type="text" name="firstname" value="<%=employee.getFname() %>" /></td>
       </tr>
     </table>
   </form>
</div>
</body>
</html>