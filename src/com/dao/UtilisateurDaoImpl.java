package com.dao;

import java.sql.*;

import com.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao {
    private DaoFactory daoFactory;

    UtilisateurDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public Utilisateur connexion  (Utilisateur utilisateur) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        Utilisateur user = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM user WHERE login = ? AND password = ?");
            preparedStatement.setString(1, utilisateur.getLogin());
            preparedStatement.setString(2, utilisateur.getPassword());
            resultat = preparedStatement.executeQuery();
            
            	while(resultat.next()) {
            		Utilisateur personne = new Utilisateur ();	
       
            		personne.setId(Integer.parseInt( resultat.getString("id")));
            		personne.setLogin(resultat.getString("login"));
            		personne.setNom(resultat.getString("name"));
            		user = personne;
            	}
           

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }



}