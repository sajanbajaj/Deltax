package com.deltax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Spotify")
public class Spotify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the top 10 songs and artists from the database(SpotifyDbUtil.java) (Model)
		try{
		List<Song> songs = SpotifyDbUtil.getSongsList();
		List<Artist> artists = SpotifyDbUtil.getArtistsList();
		request.setAttribute("songs", songs);
		request.setAttribute("artists", artists);
		}
		catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
	
		//redirect to different page(home.jsp) (View)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//adding new artist to database((SpotifyDbUtil.java) (Model) using AJAX
		
		String artistName=request.getParameter("name");
		String dob=request.getParameter("dOB");
		String bio=request.getParameter("bio");
		Artist artist = new Artist();
		artist.setArtistName(artistName);
		artist.setDob(dob);
		artist.setBio(bio);
		try{
			SpotifyDbUtil.setArtistDetails(artist);
			}
			catch(ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			}
		//RequestDispatcher dispatcher = request.getRequestDispatcher("");
		//dispatcher.include(request, response);
		
	}
}
