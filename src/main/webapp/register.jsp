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
String a,b,c,d,e,f;
a=request.getParameter("p1");
b=request.getParameter("p2");
c=request.getParameter("p3");

int x=c.indexOf('@');
int y=c.indexOf('.');
int flag=0;
    if (x == -1 || y==-1) 
 {
    	flag=1;
    	out.println("<script>");
    	out.println("alert('Invalid Email')");
    	out.println("window.location.href='registration.html'");
    	out.println("</script>");	
    }
d=request.getParameter("p4");
e=request.getParameter("p5");
f=request.getParameter("p6");

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/facebook","postgres","Sakshee06");
PreparedStatement ps=con.prepareStatement("insert into Sign_Up(name,lname,email,pass,dob,gender) values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"')");
PreparedStatement ps1=con.prepareStatement("select * from Sign_Up where email='"+c+"'");
ResultSet rs=ps1.executeQuery();
if(rs.next())
{
	out.println("<script>");
	out.println("alert('User Already Exist!!')");
	out.println("window.location.href='registration.html'");
	out.println("</script>");
}
else
{
	if(flag==0)
	{
		ps.executeUpdate();
		out.println("<script>");
		out.println("alert('registration Successfull !!')");
		out.println("window.location.href='Home.html'");
		out.println("</script>");
	}

}
%>
</body>
</html>