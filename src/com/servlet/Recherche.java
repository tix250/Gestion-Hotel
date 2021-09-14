package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DaoFactory;
import com.dao.HotelDao;
import com.beans.Hotel;

/**
 * Servlet implementation class Recherche
 */
@WebServlet("/Recherche")
public class Recherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HotelDao hotelDao;

	
	public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.hotelDao = daoFactory.getHotelDao();
    }
    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNumber = (String)request.getParameter("pageNumber");
		String mot_clef = (String)request.getParameter("mot_clef");
		if(mot_clef != null) {
			if(pageNumber != null) {
				List<Hotel> listHotel = hotelDao.rechercheHotel(Integer.parseInt(pageNumber), mot_clef);
				int nombrePage = hotelDao.nombrePageRecherche(mot_clef);
				request.setAttribute("listeHotel", listHotel);
				request.setAttribute("nbrPage", nombrePage);
				request.setAttribute("mot_clef", mot_clef);
			}
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/result_search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mot_clef = (String)request.getParameter("mot_clef");
		if(mot_clef != null) {
			List<Hotel> listHotel = hotelDao.rechercheHotel(1, mot_clef);
			int nombrePage = hotelDao.nombrePageRecherche(mot_clef);
			request.setAttribute("listeHotel", listHotel);
			request.setAttribute("nbrPage", nombrePage);
			request.setAttribute("mot_clef", mot_clef);
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/result_search.jsp").forward(request, response);
	}

}
