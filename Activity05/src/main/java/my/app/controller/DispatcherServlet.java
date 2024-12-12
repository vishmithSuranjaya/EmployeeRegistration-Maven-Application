package my.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.app.dao.EmployeeDao;
import my.app.entity.Employee;


@WebServlet("/")
public class DispatcherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url_path = request.getServletPath();
        EmployeeDao empdao = new EmployeeDao();
        
        if (url_path.equals("/save-employee")) {
            Employee emp = new Employee();
            emp.setEmpid(request.getParameter("empid"));
            emp.setFname(request.getParameter("fname"));
            emp.setLname(request.getParameter("lname"));

            if (empdao.saveEmployee(emp)) {
                response.sendRedirect("index.jsp?status=1");
            } else {
                response.sendRedirect("index.jsp?status=0");
            }
        } else if (url_path.equals("/view-employee")) {          //view all employee details
           List<Employee> empList = empdao.getAllEmployees();
           request.setAttribute("empList", empList);
           getView(request, "viewEmployee").forward(request, response);
        }else if(url_path.equals("/delete-employee")) {
        	String emp_id = request.getParameter("id");
        	if(empdao.deleteEmployee(emp_id)) {
        		response.sendRedirect("index.jsp?status=2");      //employee record has been sucessfully deleted.
        	}else {
        		response.sendRedirect("index.jsp?status=3");      //employee record deletion not sucessfull.
        	}
        }else if(url_path.equals("/update-employee")) {          //directed the page for update the details 
        	String emp_id = request.getParameter("id");
        	Employee emp = empdao.getEmployee(emp_id);
        	request.setAttribute("emp", emp);
         	getView(request, "updateEmployee").forward(request, response);                            //update employee details
        }
    }
    private RequestDispatcher getView(HttpServletRequest request,String view) {
		return request.getRequestDispatcher("WEB-INF/views/"+view+".jsp");
	}
}
