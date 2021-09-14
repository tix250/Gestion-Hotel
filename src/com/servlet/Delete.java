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

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HotelDao hotelDao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.hotelDao = daoFactory.getHotelDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getParameter("id");
		String id1 = (String)request.getParameter("id1");

		if(id !=  null) {
			int idInt = Integer.parseInt(id);
			String resultat = hotelDao.Delete(idInt);
			request.setAttribute("notification", resultat);
			request.setAttribute("pageNumber", "1");
			
			this.getServletContext().getRequestDispatcher("/AcceuilBackOffice").forward(request, response);

			
		} 
		else {
			
			String page = (String)request.getParameter("pageNumber");
            if(id1 != null ) {
    			int idInts = Integer.parseInt(id1);
    			String resultats = hotelDao.Delete(idInts);
    			request.setAttribute("notification", resultats);
            }
			List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page) , 5 ,0);
            request.setAttribute("listeHotel", listeHotel);
            request.setAttribute("nbrPage", hotelDao.nombrePage());

			this.getServletContext().getRequestDispatcher("/WEB-INF/delete.jsp").forward(request, response);

		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = "1";
		List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page) , 5 , 0);
        request.setAttribute("listeHotel", listeHotel);
        request.setAttribute("nbrPage", hotelDao.nombrePage());
      


        
        	if(request.getParameter("1") != null) {
        	 	int idSup = Integer.parseInt((String)request.getParameter("1"));
            	String resultats = hotelDao.Delete(idSup);
    			request.setAttribute("notification", resultats);
        	}
        	if(request.getParameter("2") != null) {
        	 	int idSup = Integer.parseInt((String)request.getParameter("2"));
            	String resultats = hotelDao.Delete(idSup);
    			request.setAttribute("notification", resultats);
        	}
        	if(request.getParameter("3") != null) {
        	 	int idSup = Integer.parseInt((String)request.getParameter("3"));
            	String resultats = hotelDao.Delete(idSup);
    			request.setAttribute("notification", resultats);
        	}
        	if(request.getParameter("4") != null) {
        	 	int idSup = Integer.parseInt((String)request.getParameter("4"));
            	String resultats = hotelDao.Delete(idSup);
    			request.setAttribute("notification", resultats);
        	}
        	if(request.getParameter("5") != null) {
        	 	int idSup = Integer.parseInt((String)request.getParameter("5"));
            	String resultats = hotelDao.Delete(idSup);
    			request.setAttribute("notification", resultats);
        	}
		this.getServletContext().getRequestDispatcher("/WEB-INF/delete.jsp").forward(request, response);

	

		
	}

}
