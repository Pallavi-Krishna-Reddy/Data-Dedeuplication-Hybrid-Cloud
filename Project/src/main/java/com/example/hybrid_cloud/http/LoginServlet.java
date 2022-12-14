package com.example.hybrid_cloud.http;

import com.example.hybrid_cloud.algo.DbConnection;
import com.example.hybrid_cloud.algo.MessageDigest5Base;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");

		DbConnection db=DbConnection.getDbConnection();
		db.mkcon();
		MessageDigest5Base oDigest5Base=new MessageDigest5Base();

		String sql="select * from admin where admin_id='"+id+"' and admin_pwd='"+oDigest5Base.getMD5(pwd.getBytes())+"'";
		System.out.println("sql :"+sql);
		ResultSet rs=db.fetch(sql);
		try {
			if(rs.next()) {
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("Errors.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
	}
}
