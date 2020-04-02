<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DeltaX-Home</title>
<style type="text/css">
    <%@include file="bootstrap/css/bootstrap.css" %>
    <%@include file="bootstrap/css/bootstrap.min.css" %>
    <%@include file="bootstrap/css/bootstrap-theme.css" %>
</style>
<style type="text/css">
td, th
{
text-align:center;
}
</style>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./Spotify">DeltaX</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="./Spotify">Home</a></li>
    </ul>
  </div>
</nav>

<div class="container">

<div class="row">
<div class="col-sm-6 text-left">
<h3 class="text-danger"><b>Top 10 Songs</b></h3>
</div>
<div class="col-sm-6 text-right">
<a href="./AddSong" class="btn btn-danger btn-lg">
<span class="glyphicon glyphicon-plus" style="color:white;"> </span> Add Song
</a>  
</div>
</div>

<div class="row">
<div class="table-responsive">          
  <table class="table table-bordered table-hover text-justify">
    <thead class="bg-danger">
      <tr>
        <th>Artwork</th>
        <th>Song</th>
        <th>Date of Release</th>
        <th>Artists</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="Songs" items="${songs}">
      <tr class="align-middle">
        <td><img src="data:image/jpg;base64,${Songs.artwork}" class="img-thumbnail img-responsive" style="width:200px; height:auto;" /></td>
        <td>${Songs.songName}</td>
        <td>${Songs.dateOfRelease}</td>
        <td>${Songs.artistName}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>
</div>

<div class="row">
<div class="col-sm-12 text-left">
<h3 class="text-danger"><b>Top 10 Artists</b></h3>
</div>
</div>

<div class="row">
<div class="table-responsive">          
  <table class="table table-bordered table-hover text-justify">
    <thead class="bg-danger">
      <tr>
        <th>Artists</th>
        <th>Date of Birth</th>
        <th>Songs</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="Artists" items="${artists}">
      <tr>
        <td>${Artists.artistName}</td>
        <td>${Artists.dob}</td>
        <td>${Artists.songName}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>
</div>

</div>

<footer class="container-fluid text-center" style=" position:relative; bottom:0;width:100%; background-color: black; color: white; padding: 15px;">
  <p>All Rights Reserved DeltaX : Sajan Bajaj</p>
  <p> For Assignment Purpose Only </p>
</footer>

</body>
</html>