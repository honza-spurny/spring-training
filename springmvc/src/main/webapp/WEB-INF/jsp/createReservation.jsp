<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="	java.util.*, 
					cz.sweb.pichlik.*,
					cz.sweb.pichlik.impl.*
				" %>

<%--
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
--%>
<%
	String pageTitle = "createReservation.jsp";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= pageTitle %></title>
</head>
<body>
	<h2><%= pageTitle %></h2>
	

	<form action="/springmvc/bookstore/addReservation" method=get">
		<select name="bookId">
			<% 
				List<Book> books = (List)request.getAttribute("books");
				for (Book book: books) {
					%><option value="<%= book.getId() %>"><%= book.getAuthor() + ": " + book.getName() %></option><%
				}
			%>			
		</select>
		<input type="submit" value="rezervovat" />
	</form>
 	
	<hr />
	<% for (Book book: books) { %>
		<a href="/springmvc/bookstore/addReservation/<%= book.getId() %>">Rezerervovat [<%= book.getAuthor() + ": " + book.getName() %>]</a><br /> 
	<% } %>
    
</body>
</html>