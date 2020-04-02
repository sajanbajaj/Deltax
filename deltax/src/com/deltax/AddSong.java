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

/**
 * Servlet implementation class AddSong
 */
@WebServlet("/AddSong")
public class AddSong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			List<Artist> artistNames = SpotifyDbUtil.getAllArtistNames();
			request.setAttribute("artistNames", artistNames);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/addSong.jsp");
			dispatcher.forward(request, response);
			}
			catch(ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String songName=request.getParameter("songName");
		String dateOfRelease=request.getParameter("dateOfRelease");
		String artwork=request.getParameter("artwork");
		String artistL=request.getParameter("artist");
		//String artistList="";
		//for(int i=0;i<artistL.length;i++)
		//	artistList+=artistL[i]+",";
		Song song = new Song();
		song.setSongName(songName);
		song.setDateOfRelease(dateOfRelease);
		song.setArtwork(artwork);
		song.setArtistName(artistL);
		try{
			SpotifyDbUtil.setSongDetails(song);
			}
			catch(ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			}
		
		
		
	
	}

}
