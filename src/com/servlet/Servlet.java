package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Utilisateur;
import com.dao.*;

/**
  Servlet implementation class Test
 **/
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UtilisateurDao utilisateurDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setLogin(request.getParameter("login"));
        utilisateur.setPassword(request.getParameter("password"));
        Utilisateur validation = null;
        validation = utilisateurDao.connexion(utilisateur);
        if (validation != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", validation);
            request.setAttribute("pageNumber", "1");
            this.getServletContext().getRequestDispatcher("/AcceuilBackOffice").forward(request, response);
            
        }else {
        	System.out.print(request.getParameter("login"));
        	System.out.print(request.getParameter("password"));

        	request.setAttribute("validation", "login ou mot de passe inexistant");
            this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
        }
    }
    
    

}