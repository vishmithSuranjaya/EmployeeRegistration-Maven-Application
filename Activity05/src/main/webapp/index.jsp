
<%
String message = "";
if (request.getParameter("status") != null) {
	String status = request.getParameter("status");

	if (status.equals("1")) {
		message = "Registration Successfull!";
	} else if (status.equals("0")) {
		message = "Error Occured!";
	} else if (status.equals("2")) {
		message = "Succesfully Deleted the Employee!";
	} else if (status.equals("3")) {
		message = "Error Occured!";
	}
	request.setAttribute("message", message);
}
%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/styles.css">

<style>
.content {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0;
	height: 100vh;
}

.inner-content {
	border: 1px solid black;
	border-radius: 10px;
	padding: 20px;
}

form input {
	border: 1px solid black;
	background-color: #fff;
	border-radius: 3px;
}

form input, label {
	margin: 5px;
}

.view-employee{
    background-color: green;
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    width: 50%;
}

.view-employee a:hover {
    background-color: dark-green;
}

.toast {
	visibility: hidden;
	min-width: 250px;
	margin-left: 0;
	background-color: red;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	right: 10px;
	top: 20px;
	font-size: 17px;
}


.show {
	visibility: visible;
	animation: fadein 0.5s, fadeout 0.5s 4s;
}


@keyframes fadein {from { right:0;
	opacity: 0;
}

to {
	right: 10px;
	opacity: 1;
}

}


@
keyframes fadeout {from { opacity:1;
	
}

to {
	opacity: 0;
}


</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="d-flex justify-content-center align-items-center vh-100">
<div id="toast" class="toast"></div>

	<div class="card p-4" style="width: 30rem;">
		<h3 class="text-center mb-4">Staff Login</h3>
		<form action="save-employee" method="POST">
		
		    <div class="mb-3">
				<label for="employee-d" class="form-label">Employee ID</label> 
				<input	type="text" class="form-control" id="username" name="empid" required>
			</div>
			
			<div class="mb-3">
				<label for="username" class="form-label">First Name</label> <input
					type="text" class="form-control" id="username" name="fname" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Last Name</label> <input
					type="text" class="form-control" id="password" name="lname"required>
			</div>
			<button type="submit" class="btn btn-primary w-100">Register</button>
		</form>
       <a href="view-employee" class="view-employee">View Employees -></a>

<script>
        // JavaScript function to show toast notification
        function showToast() {
            var toast = document.getElementById("toast");
            toast.className = "toast show";  // Add 'show' class to display the toast

            // After 5 seconds, remove the toast notification
            setTimeout(function() {
                toast.className = toast.className.replace("show", ""); 
            }, 5000);
        }
        
        var toastMessage = "<%= request.getAttribute("message")%>"; // Fetch the message from the server
        if (toastMessage != "null") {
            document.getElementById("toast").textContent = toastMessage;
            showToast();
        }
    </script>

</body>
</html>
