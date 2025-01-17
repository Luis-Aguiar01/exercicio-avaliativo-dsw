<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% var message = request.getParameter("error"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col justify-center items-center min-h-screen font-mono bg-gradient-to-r from-black to-gray-800">
	
	<div class="flex flex-col p-10 w-1/2 bg-white">
		<h1 class="self-center font-bold text-3xl mb-10">Delete Order</h1>
		
		<% if (message != null) {
			var error = Boolean.parseBoolean(message); 
			if (error) {
		%>
			<div class="self-center justify-self-start mb-5 text-red-700 text-xl">
					Delete failed.
			</div>
		<%  } else { %>
			<div class="self-center justify-self-start mb-5 text-green-700 text-xl">
					Delete success.
			</div>
		<%  }  %>
		<% } %>
			
		<form action="application.do?action=delete_pedido" method="POST" class="flex flex-col">
			<div class="flex items-center border rounded-lg mb-7 bg-gray-200 px-3">
				<input class="px-3 py-4 bg-transparent outline-none w-full" type="number" name="id" placeholder="Id do pedido" required/>
			</div>
		
			<input class="text-lg mt-2 bg-black py-3 self-center w-1/3 rounded-lg text-white hover:bg-gray-900 cursor-pointer font-bold" type="submit" value="Enviar">
		</form>
	</div>
	
</body>
</html>