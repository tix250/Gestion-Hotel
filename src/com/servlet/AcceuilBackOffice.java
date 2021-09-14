package com.servlet;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.beans.Hotel;
import com.dao.*;


/**
 * Servlet implementation class AcceuilBackOffice
 */
@WebServlet("/AcceuilBackOffice")
public class AcceuilBackOffice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProvinceDao provinceDao;
    private HotelDao hotelDao;
    public static final int TAILLE_TAMPON = 10240;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.provinceDao =  daoFactory.getProvinceDao();
        this.hotelDao = daoFactory.getHotelDao();
        }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page != null) {
			if(page.contentEquals("create")){
				request.setAttribute("province", provinceDao.listeProvince());
				this.getServletContext().getRequestDispatcher("/WEB-INF/create.jsp").forward(request, response);
			}
		}else {
			String page1;
			if(request.getParameter("pageNumber") != null) {
				 page1 = (String)request.getParameter("pageNumber");
			}else if (request.getAttribute("pageNumber") != null) {
				page1 = (String)request.getAttribute("pageNumber");
			}else {
				page1 = "1";
			}
			
			List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page1) , 5 , 0);
            request.setAttribute("listeHotel", listeHotel);
            request.setAttribute("nbrPage", hotelDao.nombrePage());
			this.getServletContext().getRequestDispatcher("/WEB-INF/accBackOffice.jsp").forward(request, response);
		}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("creer") != null) {
			Hotel h = new Hotel ();
			h.setNom_hotel((String)request.getParameter("nom_hotel"));
			h.setAdresse((String)request.getParameter("adresse"));
			h.setDescription((String)request.getParameter("description"));
			h.setEmail((String)request.getParameter("email"));
			h.setId_province(Integer.parseInt(request.getParameter("province")));
			h.setTelephone(Integer.parseInt(request.getParameter("telephone")));
			h.setPrix_sejour(Integer.parseInt(request.getParameter("prix_sejour")));
			
		    String CHEMIN_FICHIERS = "/C:/Users/P13A-19-Heritiana/Documents/jee/oke/test2/WebContent/imagefinale/";
			String path = CHEMIN_FICHIERS + h.getNom_hotel();
			File f1 = new File(path);
			f1.mkdir();
			CHEMIN_FICHIERS = path + "/";
			
			String image = new String ();
			//ficher image 
			
			// On récupère le champ du fichier
			
	        Collection <Part> parts = request.getParts();
			for(Part part : parts) {
	            
	        // On vérifie qu'on a bien reçu un fichier
	        String nomFichier = getNomFichier(part);
	        // Si on a bien un fichier
		        if (nomFichier != null && !nomFichier.isEmpty()) {
		            String nomChamp = part.getName();

		            // Corrige un bug du fonctionnement d'Internet Explorer
		             nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
		                    .substring(nomFichier.lastIndexOf('\\') + 1);
				    System.out.println(nomFichier);
				    image = image + nomFichier + "/";
		            // On écrit définitivement le fichier sur le disque
		            ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
		            
		        }
	        }
			h.setImage(image);
			hotelDao.insertHotel(h);
			request.setAttribute("province", provinceDao.listeProvince());
			this.getServletContext().getRequestDispatcher("/WEB-INF/create.jsp").forward(request, response);		
		}else { // lister tout les hotels
			//System.out.println("ato anh acc back");
			String page = (String)request.getAttribute("pageNumber");
			List<Hotel> listeHotel =  hotelDao.ListeHotel(Integer.parseInt(page) , 5 , 0);
            request.setAttribute("listeHotel", listeHotel);
            request.setAttribute("nbrPage", hotelDao.nombrePage());
			this.getServletContext().getRequestDispatcher("/WEB-INF/accBackOffice.jsp").forward(request, response);
		}
		
		

	}
	
	
	
	
	// ecriture ficher 
	private void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        } finally {
            try {
                sortie.close();
            } catch (IOException ignore) {
            }
            try {
                entree.close();
            } catch (IOException ignore) {
            }
        }
    }
    
    private static String getNomFichier( Part part ) {
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
    } 

}
