package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class Shop
 */
@WebServlet("/Shop")
public class Shop extends HttpServlet {
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
		String page1;
		String province = request.getParameter("id_province");
		if(province == null) {
			if(request.getParameter("pageNumber") != null) {
				 page1 = (String)request.getParameter("pageNumber");	 
			}else {
				page1 = "1";
			}
			
			List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page1) , 5 , 0);
	        request.setAttribute("listeHotel", listeHotel);
	        request.setAttribute("nbrPage", hotelDao.nombrePage());
		}else {
			int p = Integer.parseInt(province);
			if(request.getParameter("pageNumber") != null) {
				 page1 = (String)request.getParameter("pageNumber");	 
			}else {
				page1 = "1";
			}
			
			List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page1) , 10 , p);
	        request.setAttribute("listeHotel", listeHotel);
	        request.setAttribute("nbrPage", hotelDao.nombrePage());
	        request.setAttribute("id_province", p);
			
		}
		
		request.setAttribute("province", provinceDao.listeProvince());
		this.getServletContext().getRequestDispatcher("/WEB-INF/front/shop.jsp").forward(request, response);
		
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
			String rechercheAvancer = request.getParameter("rechercheAvancer");
			if(rechercheAvancer == null) {
				request.setAttribute("listeHotel", listHotel);
				request.setAttribute("nbrPage", 1);	
			}else {
				int prix = Integer.parseInt((String) request.getParameter("prix_sejour"));
				List<Hotel> listeHotel = new ArrayList<Hotel>();

				for(int i = 0 ; i < listHotel.size(); i++) {
					if(listHotel.get(i).getPrix_sejour() < prix ) {
						listeHotel.add(listHotel.get(i));
					}
				}
				List<Hotel> listeHotelFinal = new ArrayList<Hotel>();
				int id_province = Integer.parseInt((String) request.getParameter("province") );
				for(int i = 0 ; i < listeHotel.size(); i++) {
					if(listeHotel.get(i).getId_province() ==  id_province ) {
						listeHotelFinal.add(listeHotel.get(i));
					}
				}
				request.setAttribute("listeHotel", listeHotelFinal);
				request.setAttribute("nbrPage", 1);	

			}
			
		}
		request.setAttribute("province", provinceDao.listeProvince());

		this.getServletContext().getRequestDispatcher("/WEB-INF/front/shop.jsp").forward(request, response);
	

	}

}
