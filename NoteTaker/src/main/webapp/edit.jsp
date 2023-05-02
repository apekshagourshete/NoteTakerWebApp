<%@page import="java.util.List" %>
<%@page import="org.hibernate.Query" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Session" %>
<%@page import="com.entities.Note" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
	<div class="container">
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1>edit page</h1>
    	<%
    		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    		Session s=FactoryProvider.getFactory().openSession();
    		
    		Note note=(Note)s.get(Note.class, noteId);
    	%>
    	<form action ="UpdateServlet" method="post">
    		<input value="<%=note.getId()%>" name="noteId"type="hidden"/>
		  <div class="form-group">
		    <label for="title">Edit Note Title</label>
		    <input required
		    	type="text" 
		    	class="form-control" 
		    	id="title"
		    	name="title" 
		    	aria-describedby="emailHelp" 
		    	placeholder="Enter here " value="<%=note.getTitle()%>"/>
		  </div>
		  <div class="form-group">
		    <label for="content">Edit Note Content</label>
		    <textarea required
		    	id="content"
		    	name="content"
		    	placeholder="Enter your content here"
		    	class="form-control"
		    	style="height:300px;"><%=note.getContent()%></textarea>
			 
		  </div>
		  <div class="container text-right" >
		    	<button 
		    		type="submit" 
		    		class="btn btn-success">save</button>
		  </div>
			  
		</form>
    	
    	
    	
   	</div>
</body>
</html>