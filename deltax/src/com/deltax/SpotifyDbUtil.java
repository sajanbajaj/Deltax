package com.deltax;

import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.sql.rowset.serial.SerialBlob;
//import java.util.Base64;

import org.apache.commons.codec.binary.Base64;

public class SpotifyDbUtil {
	public static Connection establishConnection() throws ClassNotFoundException,SQLException
	{
		String url="jdbc:mysql://localhost:3306/deltax?useSSL=false";
		String userName="deltax_user";
		String password="pass@123";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection(url,userName,password);
		return con;
	}
	
	public static List<Song> getSongsList() throws ClassNotFoundException,SQLException, IOException
	{
		List<Song> song=new ArrayList<Song>();
		try
		{
		Connection con=establishConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select a.artwork,a.name,a.dateOfRelease,GROUP_CONCAT(b.name) from songs a LEFT JOIN songs_artists_junction c ON a.id=c.sid LEFT JOIN artists b ON b.id=c.aid group by a.name LIMIT 0, 10;");
		while(rs.next())
		{
			Blob artwork=rs.getBlob(1);
			//byte []b=artwork.getBytes(1, (int) artwork.length());
			InputStream ins=artwork.getBinaryStream();
			ByteArrayOutputStream os=new ByteArrayOutputStream();
			byte[] buffer=new byte[4096];
			int br=-1;
			while((br=ins.read(buffer))!=-1)
				os.write(buffer,0,br);
			byte []imageBytes=os.toByteArray();
			String base64Image=Base64.encodeBase64String(imageBytes);
			ins.close();
			os.close();
			String songName=rs.getString(2);
			String dateOfRelease=rs.getDate(3).toString();
			String artistsName=rs.getString(4);
			Song s=new Song(artistsName, songName, dateOfRelease, base64Image);
			song.add(s);
		}
		stmt.close();
		con.close();
		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		return song;			
		}
	
	public static List<Artist> getArtistsList() throws ClassNotFoundException,SQLException, IOException
	{
		List<Artist> artist=new ArrayList<Artist>();
		try
		{
		Connection con=establishConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select a.name, a.dOB, GROUP_CONCAT(b.name) from artists a LEFT JOIN songs_artists_junction c ON a.id=c.aid LEFT JOIN songs b ON b.id=c.sid group by a.name LIMIT 0, 10;");
		while(rs.next())
		{
			String artistName=rs.getString(1);
			String dob=rs.getDate(2).toString();
			String songsName=rs.getString(3);
			Artist a=new Artist(artistName, dob, songsName);
			artist.add(a);
		}
		stmt.close();
		con.close();
		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		return artist;
	}
	
	public static void setArtistDetails(Artist artist) throws ClassNotFoundException,SQLException
	{
		String artistName=artist.getArtistName();
		String dob=artist.getDob();
		String bio=artist.getBio();
        String s[]=dob.split("/");
        String strDate=s[2]+"-"+s[0]+"-"+s[1];
		java.sql.Date d= java.sql.Date.valueOf(strDate);
		Connection con=establishConnection();
		Statement stmt = con.createStatement();
		String insert="Insert into artists (name, dOB, bio) values ('"+artistName+"','"+d+"','"+bio+"');";
		stmt.executeUpdate(insert);
		stmt.close();
		con.close();
	}
	
	public static void setSongDetails(Song song) throws ClassNotFoundException,SQLException, IOException
	{
		String songName=song.getSongName();
		String dateOfRelease=song.getDateOfRelease();
		String artwork=song.getArtwork();
		String artistNames=song.getArtistName();
		int l=1;
		String s[]=dateOfRelease.split("/");
        String strDate=s[2]+"-"+s[0]+"-"+s[1];
		java.sql.Date d=java.sql.Date.valueOf(strDate);
		byte[] imageBytes=Base64.decodeBase64(artwork);
		Blob blob=new SerialBlob(imageBytes);
		Connection con=establishConnection();
		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		con.setAutoCommit(false);	
		String insert1="Insert into songs (name, dateOfRelease, artwork) values ('"+songName+"','"+d+"','"+blob+"');";
		stmt.addBatch(insert1);
		String set1="SET @songKey=LAST_INSERT_ID();";
		stmt.addBatch(set1);
		while(l!=0)
		{
		String fetch="Select id into @artistKey from artists where name='"+artistNames+"';";
		stmt.addBatch(fetch);
		String insert2="Insert into songs_artists_junction (sid,aid) values(songKey, artistKey);";
		stmt.addBatch(insert2);
		l--;
		}
		stmt.executeBatch();
		con.commit();
		con.setAutoCommit(true);
		stmt.close();
		con.close();
	}
	
	public static List<Artist> getAllArtistNames() throws ClassNotFoundException,SQLException, IOException
	{
		List<Artist> artistNames= new ArrayList<Artist>();
		try
		{
		Connection con=establishConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select name from artists;");
		while(rs.next())
		{
			String artistName=rs.getString(1);
			Artist a=new Artist(artistName);
			artistNames.add(a);
		}
		stmt.close();
		con.close();
		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		return artistNames;
	}
	
	}
	
