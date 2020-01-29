<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
	<body>
		<% session.invalidate(); %> <!-- Fecha a sessão -->
		<script>
   		alert('Redirecionando a home...');
    	window.location = 'index.jsp';
		</script>
	</body>
<html>