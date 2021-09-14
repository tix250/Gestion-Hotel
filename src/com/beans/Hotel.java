package com.beans;

public class Hotel {
	private int id_hotel;
	private String nom_hotel;
	private int id_province;
	private String email;
	private int telephone;
	private String Description;
	private String image;
	private int prix_sejour;
	private String adresse;
	
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public int getId_hotel() {
		return id_hotel;
	}
	public void setId_hotel(int id_hotel) {
		this.id_hotel = id_hotel;
	}
	public String getNom_hotel() {
		return nom_hotel;
	}
	public void setNom_hotel(String nom_hotel) {
		this.nom_hotel = nom_hotel;
	}
	public int getId_province() {
		return id_province;
	}
	public void setId_province(int id_province) {
		this.id_province = id_province;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTelephone() {
		return telephone;
	}
	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrix_sejour() {
		return prix_sejour;
	}
	public void setPrix_sejour(int prix_sejour) {
		this.prix_sejour = prix_sejour;
	}
	
	
	
}
