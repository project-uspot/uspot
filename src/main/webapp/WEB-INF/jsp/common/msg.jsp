<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test="${script == 'reload'.toString()}">
		<script>
			alert("<c:out value='${msg}'/>");
			opener.location.reload();
			self.close();
		</script>
	</c:when>
	<c:when test="${script == 'redirect'.toString()}">
		<script>
		 	var msg = "<c:out value='${msg}'/>";
		    var url = "<c:out value='${url}'/>";
		    if(msg != ""){
		    	alert(msg);	
		    }
		    location.href = url;
		</script>
	</c:when>
	<c:when test="${script == 'back'.toString()}">
		<script>
	    	alert("<c:out value='${msg}'/>");	
	    	history.go(-1);
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("<c:out value='${msg}'/>");
			self.close();
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>

</body>
</html>