package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.beans.Province;

public class ProvinceDaoImpl implements ProvinceDao {
	private DaoFactory daoFactory;

	ProvinceDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

	@Override
	public List<Province> listeProvince() {
		Connection connexion = null;
		Statement  statement = null;
        ResultSet resultat = null;
        List<Province> province =  new ArrayList<Province>();
        
        try {
        	 connexion = daoFactory.getConnection();
             statement = connexion.createStatement();
             resultat = statement.executeQuery("SELECT * FROM province");
            	while(resultat.next()) {
            		Province provincesearch = new Province();
            		int id_province = resultat.getInt("id_province");
                    String nom_province = resultat.getString("nom_province");
            		

                    provincesearch.setId_province(id_province);
                    provincesearch.setNom_province(nom_province);
                    System.out.println(provincesearch.getNom_province());
                    province.add(provincesearch);	
	            }
	           

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return province;
	}
	

}
