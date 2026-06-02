<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footerAdmin.css">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css?v=<%= System.currentTimeMillis() %>">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footerPublica.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <title>Instituto Columbia</title>
</head>

<body>

<jsp:include page="WEB-INF/includes/headerPublica.jsp" />

<section class="intro">
    <h1>Nossa história se faz com cultura e esporte.</h1>
</section>
<section class="container">
    <h2>teste</h2>

</section>
<section id="contato">
<jsp:include page="/WEB-INF/includes/footerPublica.jsp" />
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>