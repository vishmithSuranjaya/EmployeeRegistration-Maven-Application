<%@ page import="my.app.entity.Employee"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Employee</title>
<style>
/* General reset and body styling */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    box-sizing: border-box;
}

/* Container styling */
.container {
    width: 80%;
    max-width: 900px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    padding: 20px;
}

/* Table styling */
.container table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.container table th, 
.container table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

.container table th {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
}

.container table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.container table tr:hover {
    background-color: #f1f1f1;
}

/* Action buttons */
#update-btn {
    background-color: #007bff;
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

#update-btn:hover {
    background-color: #0056b3;
}

#delete-btn {
    background-color: #ff4d4d;
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

#delete-btn:hover {
    background-color: #cc0000;
}

/* Header styling */
h2 {
    text-align: center;
    color: #333;
    font-weight: 500;
    margin: 0;
    padding: 10px;
}

.backHome a{
   text-decoration: none;
   color: #fff;
}

.backHome{
    background-color: #007bff;
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    width: 42px;
}

.backHome a:hover {
    background-color: #0056b3;
}


</style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="backHome">Home</a>
        <h2>View Employee</h2>
        <table>
            <tr>
                <th>Employee ID</th>
                <th>First Name</th>
                <th>Last Name</th>
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
                <td>
                    <a href="update-employee?id=<%=employee.getEmpid()%>" id="update-btn">Update</a>
                    <a href="delete-employee?id=<%=employee.getEmpid()%>" id="delete-btn">Delete</a>
                </td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
    
    
</body>
</html>
