package com.dao;

import com.beans.Hotel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class HotelDaoImpl implements HotelDao{
	private DaoFactory daoFactory;

	HotelDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

	@Override
	public void insertHotel(Hotel hotel) {
		Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO hotel(nom_hotel, id_province, Adresse, email, telephone, Description , image , prix_sejour) VALUES(?, ? , ? , ? , ? , ? ,? ,?);");
            preparedStatement.setString(1, hotel.getNom_hotel());
            preparedStatement.setInt(2, hotel.getId_province());
            preparedStatement.setString(3, hotel.getAdresse());
            preparedStatement.setString(4, hotel.getEmail());
            preparedStatement.setInt(5, hotel.getTelephone());
            preparedStatement.setString(6, hotel.getDescription());
            preparedStatement.setString(7, hotel.getImage());
            preparedStatement.setInt(8, hotel.getPrix_sejour());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

	}

	@Override
	public List<Hotel> ListeHotel(int numpage , int nombreElementPage , int id_province) {
		List<Hotel> listeHotel = new ArrayList<Hotel>();
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        try {
            connexion = daoFactory.getConnection();
            String req = "SELECT * FROM hotel";
            if(id_province != 0) {
            	req = req + " WHERE id_province= ? LIMIT ? OFFSET ? ";
            	preparedStatement = connexion.prepareStatement(req);
	            preparedStatement.setInt(1, id_province);
	            preparedStatement.setInt(2, nombreElementPage);
	            preparedStatement.setInt(3, (numpage - 1) * nombreElementPage);
	            resultat = preparedStatement.executeQuery();	
            }else {
            	req = req + " LIMIT ? OFFSET ?";
	            preparedStatement = connexion.prepareStatement(req);
	            preparedStatement.setInt(1, nombreElementPage);
	            preparedStatement.setInt(2, (numpage - 1) * nombreElementPage);
	            resultat = preparedStatement.executeQuery();	
            }
            	while(resultat.next()) {
            		Hotel hotel = new Hotel ();	
            		hotel.setId_hotel(Integer.parseInt( resultat.getString("id_hotel")));
            		hotel.setNom_hotel(resultat.getString("nom_hotel"));
            		hotel.setId_province(Integer.parseInt(resultat.getString("id_province")));
            		hotel.setAdresse(resultat.getString("Adresse"));
            		hotel.setEmail(resultat.getString("email"));
            		hotel.setTelephone(Integer.parseInt(resultat.getString("telephone")));
            		hotel.setDescription(resultat.getString("Description"));
            		hotel.setPrix_sejour(Integer.parseInt(resultat.getString("prix_sejour")));
            		hotel.setImage(resultat.getString("image"));
            		listeHotel.add(hotel);
            	}
           

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return listeHotel;
	}
	
	@Override
	public List<Hotel> rechercheHotel(int numpage , String mot_clef) {
		List<Hotel> listeHotel = new ArrayList<Hotel>();
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        int nombreElementPage = 5;
        try {
            connexion = daoFactory.getConnection();
            String requette = "SELECT * FROM hotel WHERE nom_hotel LIKE '%" + mot_clef + "%' LIMIT ? OFFSET ?" ;
            preparedStatement = connexion.prepareStatement(requette);
            //preparedStatement.setString(1 , mot_clef);
            preparedStatement.setInt(1, nombreElementPage);
            preparedStatement.setInt(2, (numpage - 1) * nombreElementPage);
            resultat = preparedStatement.executeQuery();
            
            	while(resultat.next()) {
            		Hotel hotel = new Hotel ();	
            		hotel.setId_hotel(Integer.parseInt( resultat.getString("id_hotel")));
            		hotel.setNom_hotel(resultat.getString("nom_hotel"));
            		hotel.setId_province(Integer.parseInt(resultat.getString("id_province")));
            		hotel.setAdresse(resultat.getString("Adresse"));
            		hotel.setEmail(resultat.getString("email"));
            		hotel.setTelephone(Integer.parseInt(resultat.getString("telephone")));
            		hotel.setDescription(resultat.getString("Description"));
            		hotel.setPrix_sejour(Integer.parseInt(resultat.getString("prix_sejour")));
            		hotel.setImage(resultat.getString("image"));
            		listeHotel.add(hotel);
            	}
           

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return listeHotel;
	}
	

	@Override
	public int nombrePage() {
		int nombreP = 0 ; 
		int i = 0;
		Connection connexion = null;
	        Statement statement = null;
	        ResultSet resultat = null;

	        try {
	            connexion = daoFactory.getConnection();
	            statement = connexion.createStatement();
	            resultat = statement.executeQuery("SELECT * FROM hotel;");

	            while (resultat.next()) {
	               i++;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    nombreP = i/5;
	    if(i%5 != 0) {
	    	nombreP++;
	    }
		return nombreP;
	}

	@Override
	public String Delete(int idHotel) {
		String resultat; 
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM hotel WHERE id_hotel = ?");
            preparedStatement.setInt(1, idHotel);
            preparedStatement.executeUpdate();
            resultat = "Supprimer avec succes";
        } catch (SQLException e) {
        	resultat = "erreur pdt la suppresion";
            e.printStackTrace();
        }
		
		return resultat;
	}

	@Override
	public int nombrePageRecherche(String mot_clef) {
		int nombreP = 0 ; 
		int i = 0;
        PreparedStatement preparedStatement = null;
		Connection connexion = null;
	    ResultSet resultat = null;

	        try {
	            connexion = daoFactory.getConnection();
	            String requette = "SELECT * FROM hotel WHERE nom_hotel LIKE '%" +  mot_clef + "%'";
	            preparedStatement = connexion.prepareStatement(requette);
	           
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	               i++;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    nombreP = i/5;
	    if(i%5 != 0) {
	    	nombreP++;
	    }
		return nombreP;
	}

	@Override
	public Hotel hotelDetails(int id) {
		Hotel hotel = new Hotel ();	
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        try {
            connexion = daoFactory.getConnection();
            String requette = "SELECT * FROM hotel WHERE id_hotel = ?" ;
            preparedStatement = connexion.prepareStatement(requette);
            //preparedStatement.setString(1 , mot_clef);
            preparedStatement.setInt(1, id);

            resultat = preparedStatement.executeQuery();
            
            	while(resultat.next()) {
            		hotel.setId_hotel(Integer.parseInt( resultat.getString("id_hotel")));
            		hotel.setNom_hotel(resultat.getString("nom_hotel"));
            		hotel.setId_province(Integer.parseInt(resultat.getString("id_province")));
            		hotel.setAdresse(resultat.getString("Adresse"));
            		hotel.setEmail(resultat.getString("email"));
            		hotel.setTelephone(Integer.parseInt(resultat.getString("telephone")));
            		hotel.setDescription(resultat.getString("Description"));
            		hotel.setPrix_sejour(Integer.parseInt(resultat.getString("prix_sejour")));
            		hotel.setImage(resultat.getString("image"));
            	}
           

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return hotel;
	}


	
}
