package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Hotel;
import com.dao.DaoFactory;
import com.dao.HotelDao;
import com.dao.ProvinceDao;

/**
 * Servlet implementation class Details
 */
@WebServlet("/Details")
public class Details extends HttpServlet {
    
 /**
	 * 
	 */
private static final long serialVersionUID = 1L;
private HotelDao hotelDao;
 private ProvinceDao provinceDao;
 
 /**
  * @see HttpServlet#HttpServlet()
  */
 public void init() throws ServletException {
     DaoFactory daoFactory = DaoFactory.getInstance();
     this.hotelDao = daoFactory.getHotelDao();
     this.provinceDao =  daoFactory.getProvinceDao();
 }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = (String)request.getParameter("id");
		if(id != null ) {
			int idInt = Integer.parseInt(id);
			Hotel h = new Hotel();
			h = hotelDao.hotelDetails(idInt);
			request.setAttribute("listeHotel", h );
			
		}
		request.setAttribute("province", provinceDao.listeProvince());
		this.getServletContext().getRequestDispatcher("/WEB-INF/front/details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
