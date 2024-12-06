<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "my.app.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
  <h2>View Employee</h2>
  <tr>
     <th>Employee ID</th>
     <th>First Name</th>
     <th>Last name </th>
     <th>Actions</th>
  </tr>
  
  <% 
     List<Employee> empList = (List) request.getAttribute("empList");
  for(Employee employee : empList){
	  %>
	  <tr>
    <td><%=employee.getEmpid() %></td>
    <td></td>
    <td></td>
    <td><a href="update-employee?id=<%=employee.getEmpid() %>">Update</a> | <a href="delete-employee?id<%=employee.getEmpid() %>">Delete</a></td>
  </tr>
  
  <%
  }
  %>
  
</table>
</body>
</html>