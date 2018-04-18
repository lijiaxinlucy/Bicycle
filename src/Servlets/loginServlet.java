package Servlets;

import java.io.IOException;
import java.util.List;

import javax.management.relation.Role;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.engine.transaction.jta.platform.internal.BorlandEnterpriseServerJtaPlatform;
import org.hibernate.query.Query;

import model.*;
import dbutils.DBConnection;

/**
 * Servlet implementation class loginServlert
 */
@WebServlet("/loginServlet")//这里的servlet要跟jsp里的action里的一致
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		Session session = DBConnection.getFactory().openSession();//用configuration对象获取session对象
		String hql = "from User where UserID=:ids and Password=:password";//User为model里的模型
		Query<Users> query = session.createQuery(hql);//用session对象查询
		query.setString("ids", id);//
		query.setString("password", password);
		
		List<Users> obj = query.list();
		for(Users user:obj){
			String name=user.getName();
			String userid=user.getId();
			//System.out.println(userid);
			String sql="from Role_User where UserID=:userids";//查找userid对应的roleid
			Query<Role_User> query2=session.createQuery(sql);
			query2.setString("userids", userid);
			List<Role_User> obj2=query2.list();
			for(Role_User ru:obj2)
			{
				//System.out.println(ru.getRoleId());
				String roleid=ru.getRoleId();
				System.out.println(name+"的角色id是"+roleid);
				String sql2="from Roles where RoleID=:roleids";
				Query<Roles> query3=session.createQuery(sql2);
				query3.setString("roleids", roleid);
				List<Roles> obj3=query3.list();
				for(Roles role:obj3){
					System.out.println(role.getRoleName());
				}
			}
			
		}
		if(!obj.isEmpty())
			response.sendRedirect("./perCoachhome.jsp");
		else  response.sendRedirect("./error.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
