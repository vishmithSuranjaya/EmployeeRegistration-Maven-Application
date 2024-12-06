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


@WebServlet(urlPatterns = {"/save-employee", "/view-employee"})
public class DispatcherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    private EmployeeDao empdao = new EmployeeDao(); // Initialize once, not per request

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url_path = request.getServletPath();
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
        } else if (url_path.equals("/view-employee")) {
           List<Employee> empList = empdao.getAllEmployees();
           request.setAttribute("empList", empList);
           getView(request, "viewEmployee").forward(request, response);
        }else if(url_path.equals("/delete-employee")) {
        	empdao.deleteEmployee(request.getParameter("empid"));
        }
    }
    private RequestDispatcher getView(HttpServletRequest request,String view) {
		return request.getRequestDispatcher("WEB-INF/views/"+view+".jsp");
	}
}
