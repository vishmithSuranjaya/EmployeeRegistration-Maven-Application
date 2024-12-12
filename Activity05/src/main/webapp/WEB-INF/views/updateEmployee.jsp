<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="my.app.entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>
<style>
/* Reset and body styling */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f7f9fc;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Container styling */
.container {
    width: 50%;
    max-width: 600px;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* Form table styling */
form table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

form table td {
    padding: 10px;
    vertical-align: middle;
}

form table td:first-child {
    text-align: right;
    font-weight: bold;
    color: #333;
}

form table td:last-child {
    text-align: left;
}

form input[type="text"] {
    width: 95%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

/* Button styling */
form input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 20px;
    float: right;
    transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
    background-color: #45a049;
}

/* Header styling */
h2 {
    text-align: center;
    color: #333;
    font-weight: 500;
}
</style>
</head>
<body>
<div class="container">
    <h2>Edit Employee</h2>
    <%
        Employee employee = (Employee) request.getAttribute("emp");
    %>
    <form action="save-employee" method="post">
        <table>
            <tr>
                <td>Employee ID</td>
                <td><input type="text" name="empid" value="<%= employee != null ? employee.getEmpid() : "" %>" readonly /></td>
            </tr>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="fname" value="<%= employee != null ? employee.getFname() : "" %>" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lname" value="<%= employee != null ? employee.getLname() : "" %>" /></td>
            </tr>
        </table>
        <input type="submit" value="Update Employee" />
    </form>
</div>
</body>
</html>
