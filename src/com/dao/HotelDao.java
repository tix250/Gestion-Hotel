package com.dao;

import java.util.List;

import com.beans.Hotel;

public interface HotelDao {
	void insertHotel (Hotel hotel);
	List<Hotel> ListeHotel (int numpage , int nombreElementPage , int id_province);
	int nombrePage ();
	String Delete (int idHotel);
	List<Hotel> rechercheHotel (int numpage , String mot_clef);
	int nombrePageRecherche (String mot_clef );
	Hotel hotelDetails (int id);


}
