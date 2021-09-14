package com.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProvinceDao provinceDao;   
    private HotelDao hotelDao;

    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.provinceDao =  daoFactory.getProvinceDao();
        this.hotelDao = daoFactory.getHotelDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Hotel> listeHotel = hotelDao.ListeHotel(1 , 9 , 0);
		request.setAttribute("listeHotel", listeHotel );
		request.setAttribute("province", provinceDao.listeProvince());
		this.getServletContext().getRequestDispatcher("/WEB-INF/front/index.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
