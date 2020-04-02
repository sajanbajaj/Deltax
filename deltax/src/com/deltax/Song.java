package com.deltax;

public class Song extends SongsArtists {
	private String dateOfRelease;
	private String artwork;
	public Song(){
		super();
	}
	public Song(String artistName, String songName, String dateOfRelease, String artwork) {
		this.artistName= artistName;
		this.songName = songName;
		this.dateOfRelease = dateOfRelease;
		this.artwork = artwork;
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
	public String getDateOfRelease() {
		return dateOfRelease;
	}
	public void setDateOfRelease(String dateOfRelease) {
		this.dateOfRelease = dateOfRelease;
	}
	public String getArtwork() {
		return artwork;
	}
	public void setArtwork(String artwork) {
		this.artwork = artwork;
	}

}
