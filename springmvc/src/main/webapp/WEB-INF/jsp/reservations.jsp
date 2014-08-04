<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
--%>
<%
	String pageTitle = "reservations.jsp";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= pageTitle %></title>
</head>
<body>
	<h2><%= pageTitle %></h2>
	
    <table border="1"> 
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
        </tr>
        <%--
        <c:forEach var="user" items="${users}">
            <tr>
              <td><c:out value="${user.id}"/></td>
              <td><c:out value="${user.name}"/></td>
              <td><c:out value="${user.email}"/></td>
            </tr>
        </c:forEach>
        --%>
    </table>
    
    reservations: ${reservations}<br />
    books: ${books}
</body>
</html>