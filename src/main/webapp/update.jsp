<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String x,y;
x=request.getParameter("s1");
y=request.getParameter("s2");
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/facebook","postgres","Sakshee06");

PreparedStatement ps1=con.prepareStatement("update Sign_Up set pass='"+y+"' where email='"+x+"'");
ps1.executeUpdate();
out.println("<script>");
out.println("alert('Password Changed')");
out.println("window.location.href='Home.html'");
out.println("</script>");
%>
</body>
</html>