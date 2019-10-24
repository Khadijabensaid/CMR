<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <h1>Tests JDBC</h1>

        <c:forEach items="${ messages }" var="message" varStatus="boucle">
            <p>${ boucle.count }. ${ message }</p>
        </c:forEach>
    </body>
</html>