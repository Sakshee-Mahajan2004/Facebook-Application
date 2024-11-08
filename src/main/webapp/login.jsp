<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String x,y;
x=request.getParameter("a1");
y=request.getParameter("a2");

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/facebook","postgres","Sakshee06");
PreparedStatement ps=con.prepareStatement("select * from Sign_Up where email='"+x+"'and pass='"+y+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	HttpSession s1=request.getSession();
	s1.setAttribute("temp",x);
	out.println("<script>");
	out.println("alert('Login Successfull')");
	out.println("window.location.href='dashboard.jsp'");
	out.println("</script>");
}
else
{
	out.println("<script>");
	out.println("alert('Invalid Credentials')");
	out.println("window.location.href='Home.html'");
	out.println("</script>");
}

%>
</body>
</html>