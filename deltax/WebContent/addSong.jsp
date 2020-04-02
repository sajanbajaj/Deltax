<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DeltaX-Add Song</title>
<style type="text/css">
    <%@include file="bootstrap/css/bootstrap.css" %>
    <%@include file="bootstrap/css/bootstrap-theme.css" %>
</style>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/modal.js"></script>
<script src="bootstrap/js/alert.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./Spotify">DeltaX</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="./Spotify">Home</a></li>
    </ul>
  </div>
</nav>

<div class="container">

<div class="row">
<div class="col-sm-12 text-left">
<h3 class="text-danger"><b>Adding a new Song</b></h3>
</div>
</div>

<div class="row" style="margin-top:20px;">
<div class="col-sm-12 text-left">
<div class="col-sm-12">
         <div class="alert alert-warning alert-dismissible fade in" id="alert5">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
           <strong>All fields are required.</strong> Please fill all fields.
         </div>
        </div>
        <div class="col-sm-12">
         <div class="alert alert-success alert-dismissible fade in" id="alert6">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
           <strong>Success!</strong> Song details added successfully.
         </div>
       </div>
<form class="form-horizontal"  method="post" name="songform" id="songform">
  <div class="form-group">
    <label class="label-control col-sm-3" for="songName">Song Name</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="songName" name="songName" required>
    </div>
  </div>
  <div class="form-group">
    <label class="label-control col-sm-3" for="dateOfReleased">Date Released</label>
    <div class="col-sm-4">
    <input type="date" class="form-control" id="dateOfReleased" name="dateOfReleased" required>
    </div>
  </div>
  <div class="form-group">
    <label class="label-control col-sm-3" for="artwork">Artwork</label>
    <div class="col-sm-4">
      <input type="file" class="form-control" id="artwork" name="artwork" title="Upload Image" required>
    </div>
    <div class="col-sm-5">
    <div class="alert alert-warning alert-dismissible fade in" id="alert1">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Alert!</strong> Only .jpg, .jpeg, .png or .gif image file extensions are allowed.
    </div>
    </div>
    <div class="col-sm-5">
    <div class="alert alert-success alert-dismissible fade in" id="alert2">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> Image file selected successfully.
    </div>
    </div>
  </div>
  <div class="form-group">
    <label class="label-control col-sm-3" for="artist">Artists</label>
    <div class="col-sm-4">
    <select multiple class="form-control" id="artist" name="artist" required>
    <c:forEach var="Names" items="${artistNames}">
    <option value="${Names.artistName}">${Names.artistName}</option>
    </c:forEach>
    </select>
    </div>
    <div class="col-sm-4">
    <a href="#myModal" data-toggle="modal" class="btn btn-danger" data-target="#myModal">
    <span class="glyphicon glyphicon-plus" style="color:white;"> </span> Add Artist
    </a> 
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-2">
      <input type="reset" class="btn btn-default" value="Cancel">
    </div>
    <div class="col-sm-2">
      <input type="submit" class="btn btn-danger" value="Save" id="save" name="save">
    </div>
  </div>
</form>
</div>
</div>

<div class="row">
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog modal-md">
         <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-left">Add a new Artist</h4>
         </div>
         <div class="modal-body">
            <form class="form-horizontal" role="form" method="post" id="artistform">
        <div class="col-sm-12">
         <div class="alert alert-warning alert-dismissible fade in" id="alert3">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
           <strong>All fields are required.</strong> Please fill all fields.
         </div>
        </div>
        <div class="col-sm-12">
         <div class="alert alert-success alert-dismissible fade in" id="alert4">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
           <strong>Success!</strong> Artist details added successfully.
         </div>
       </div>
            <div class="form-group">
               <label class="label-control col-sm-3" for="name">Artist Name</label>
               <div class="col-sm-4">
               <input type="text" class="form-control" id="name" name="name" required>
               </div>
            </div>
            <div class="form-group">
               <label class="label-control col-sm-3" for="dOB">Date of Birth</label>
               <div class="col-sm-4">
               <input type="date" class="form-control" id="dOB" name="dOB" required>
               </div>
            </div>
            <div class="form-group">
               <label class="label-control col-sm-3" for="bio">Bio</label>
               <div class="col-sm-4">
               <textarea class="form-control" rows="4" id="bio" name="bio" required></textarea>
               </div>
            </div>
            <div class="form-group">
            <div class="col-sm-offset-7 col-sm-2">
            <input type="reset" class="btn btn-default" value="Cancel">
            </div>
            <div class="col-sm-2">
            <input type="submit" class="btn btn-danger" value="Done" id="done" name="done"></a>
            </div>
            </div>
            </form>    
         <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
         </div>
         </div>
         </div>
   </div>
</div>
  
</div>

<footer class="container-fluid text-center" style=" position:relative; bottom:0;width:100%; background-color: black; color: white; padding: 15px;">
  <p>All Rights Reserved DeltaX : Sajan Bajaj</p>
  <p> For Assignment Purpose Only </p>
</footer>

<script>
$(document).ready(function(){
        $('.alert').hide() 
});

  (function($) {
    $('#artwork').change(function() {
      var file = $('input[type="file"]').val();
      var exts = ['jpg','jpeg','png','gif'];
      if ( file ) {
        var get_ext = file.split('.').reverse();
        if ( $.inArray ( get_ext[0].toLowerCase(), exts ) > -1 ){
        	$('#alert2').show()
        	$('#alert1').hide()
        } else {
        	$('#artwork').val(null);
        	$('#alert1').show();
        	$('#alert2').hide()
        }
      }
    });
  })(jQuery);  
  
</script>

<script>
$(document).ready(function() {
$('#done').click(function(event) {
	event.preventDefault();
	var name=$('#name').val();
	var dOB=$('#dOB').val();
	var bio=$('#bio').val();
	if(name=='' || dOB=='' || bio==''){
		$('#alert3').show();
	}
	else {
		$.ajax({
			url: "/Spotify",
			type: "POST",
			data: {
			name: name,
			dOB: dOB,
			bio: bio,
			success : function(data){
				$('#alert4').show();
				$('#artistform').trigger("reset");
			}
			}
			});
	}
});
});
</script>

<script>
$(document).ready(function() {
$('#save').click(function(event) {
	event.preventDefault();
	var songName=$('#songName').val();
	var dateOfRelease=$('#dateOfRelease').val();
	var artwork=$('#artwork').val();
	var artist=$('#artist').val();
	if(songName=='' || dateOfRelease=='' || artwork=='' || artist==''){
		$('#alert5').show();
	}
	else {
		$.ajax({
			url: "/AddSong",
			type: "POST",
			data: {
			songName: songName,
			dateOfRelease: dateOfRelease,
			artwork: artwork,
			artist: artist,
			success : function(data){
				$('#alert6').show();
				$('#songform').trigger("reset");
			}
			}
			});
	}
});
});
</script>

</body>
</html>