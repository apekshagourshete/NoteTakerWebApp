<%@page import="java.util.List" %>
<%@page import="org.hibernate.Query" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Session" %>
<%@page import="com.entities.Note" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AllNotes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
	<div class="container">
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1 class="text-uppercase">All Notes:</h1>
    	
    	<div class="row">
    		<div class="col-12">
    		   <!-- this is list of all notes -->
    		  	<% 
		    	  Session s=FactoryProvider.getFactory().openSession();
		    	  Query q=s.createQuery("from Note");
		    	  List<Note> list=q.list();
		    	  for(Note note:list)
		    	  {
    		    %><!-- this card will run in loop -->
		    		  <div class="card mt-3">
		    		  	<img class="card-img-top"style="max-width:90px"src="img/notepadicon.png"alt="Card image cap">
		    		  		<div class="card-body px-5">
		    		  			<h5 class="card-title"><%=note.getTitle() %></h5>
		    		  			<p class="card-text"><%=note.getContent() %>
		    		  			<div class="container text-right mt-3">
		    		  				<a href="DeleteServlet?note_id=<%= note.getId()%>"class="btn btn-danger">Delete</a>
		    		  				<a href="edit.jsp?note_id=<%= note.getId()%>"class="btn btn-primary">Edit</a>
		    		  			</div>
		    		  		</div>
		    		  </div> 
			        <%
			 		  }
			    	  s.close();
			         %>
    		  </div>
    	</div>
    	
    	
   	</div>
	    	
</body>
</html>