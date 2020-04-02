package com.deltax;

public class Artist extends SongsArtists {
	private String dob;
	private String bio;
	public Artist()
	{
		super();
	}
	public Artist(String artistName)
	{
		super();
		this.artistName=artistName;
	}
	public Artist(String artistName, String dob) {
		this(artistName);
		this.dob = dob;
	}
	public Artist(String artistName, String dob, String songName) {
		this(artistName,dob);
		this.songName = songName;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	

}
