<%@ page import="my.app.entity.Employee"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
 display: flex;
 justify-content: center;
 align-items: center;
 marign:0;
 height:100vh;
}

.container table{
 border: 1px solid black;
 text-align: center;
 padding-bottom: 3px;
}
.container table,tr{
 padding-buttom:2px;
}
#update-btn{
  background-color: red;
  color: #fff;
  margin:1px;
  padding:3px;
}
</style>
</head>
<body>
	<div class="container">
		<table>
			<h2>View Employee</h2>
			<tr>
				<th>Employee ID</th>
				<th>First Name</th>
				<th>Last name</th>
				<th>Actions</th>
			</tr>

			<%
			List<Employee> empList = (List) request.getAttribute("empList");
			for (Employee employee : empList) {
			%>
			<tr>
				<td><%=employee.getEmpid()%></td>
				<td><%=employee.getFname()%></td>
				<td><%=employee.getLname()%></td>
				<td><a href="update-employee?id=<%=employee.getEmpid()%>" id="update-btn">Update</a>
					| <a href="delete-employee?id=<%=employee.getEmpid()%>" id="delete-btn">Delete</a></td>
			</tr>

			<%
			}
			%>

		</table>
	</div>
</body>
</html>