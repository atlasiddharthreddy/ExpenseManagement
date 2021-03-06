<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.utility.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.operation.*"%>
<%@page import="com.dbconnection.*"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Stock Maintenance(Display Product Details)</title>
</head>
<body
	background="BackgroundImg.jpg">
	
	<c:if test="${type eq 'admin'}">
		<a href="AddProduct.jsp">Add Expense</a>
	</c:if>
	<center>
	<%String Name= (String) session.getAttribute("uname"); 
		out.println(" <font style='font-family: fantasy;' color='Blue' size='15'> Hello "+Name+"</font>");
	%></center>
	<h3 align="right"><a href="HomePage.html">LogOut</a></h3>
	
	<center>
		<font style="font-family: fantasy;" color="Blue" size="15">Product
			Details </font>
		<table border='2'>
			<tr>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Price</th>
				<th>Category</th>
				<c:if test="${type eq 'admin'}">
					<th>Update</th>
					<th>Delete</th>
				</c:if>
			</tr>
			
			<c:set var="Total" value="${0}" />
			<c:forEach items="${productlistList}" var="product">
			
			<c:if test="${uname eq product.username }">
			<c:set var="Total" value="${Total + product.pprice}" />
				<tr>
					<td>${ product.pid}</td>
					<td>${ product.pname}</td>
					<td>${ product.pprice}$</td>
					<td>${product.pcatagory}</td>

					<c:if test="${type eq 'admin'}">
						<td><a href="UpdateController?pid=${ product.pid}"> Update</a></td>
						<td><a href="DeleteProductServlet?pid=${ product.pid}"> Delete</a></td>
						
					</c:if>
				</tr>
				</c:if>
				
					
			</c:forEach>
			<tr>
			<td> </td>
			<td>Total Expenses </td>
			
			<td>${Total} $</td>
			</tr>
		</table>
		 
		
	</center>

</body>
</html>