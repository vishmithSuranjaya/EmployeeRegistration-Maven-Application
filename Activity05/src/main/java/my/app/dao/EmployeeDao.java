package my.app.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import my.app.entity.Employee;
import my.app.hibernate.HibernateUtil;

public class EmployeeDao {
	private Session session;
	private Transaction transaction;

	public boolean saveEmployee(Employee emp) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.save(emp);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
				return false;
			}
		}

		return true;
	}
	
	public List<Employee> getAllEmployees(){
		
		List<Employee> emplist = null;
		session = HibernateUtil.getSessionFactory().openSession();
		emplist = session.createQuery("FROM Employee").getResultList();
		
		return emplist;
	}
	
	public Employee getEmployee(String emp_id) {
		
		Employee emp = null;
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.get(Employee.class, emp_id);
		transaction.commit();
		return emp;
	}
	
	public boolean deleteEmployee(String emp_id) {
		
		session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		Employee emp = session.get(Employee.class, emp_id);
		
		if(emp != null) {
			session.delete(emp);
			transaction.commit();
		}
		return true;
	}
}
