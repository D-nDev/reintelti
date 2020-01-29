<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
	<body>
		<% session.invalidate(); %> <!-- Fecha a sessão -->
		<script>
    	window.location = 'login.jsp';
		</script>
	</body>
<html>