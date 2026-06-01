<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">

    <title>Instituto Columbia</title>
</head>

<body>

<jsp:include page="WEB-INF/includes/header.jsp" />

<div class="container">

    <div class="box">

        <h2>Instituto Columbia</h2>


        <a class="login-link" href="${pageContext.request.contextPath}/login">

            <button type="button">Fazer Login</button>

        </a>

        <hr>


        <h3>Fale Conosco</h3>

        <form action="mensagem" method="post">

            <input type="text" name="nome" class="form-control" placeholder="Seu nome" required>

            <input type="email" name="email" class="form-control" placeholder="Seu e-mail" required>

            <input type="text" name="assunto" class="form-control" placeholder="Assunto" required>

            <textarea name="mensagem" class="form-control" placeholder="Digite sua mensagem" required></textarea>

            <button type="submit">Enviar Mensagem</button>

        </form>

        <c:if test="${not empty sucesso}">
            <p style="color:green">${sucesso}</p>
        </c:if>

        <c:if test="${not empty erro}"><p style="color:red">${erro}</p>
        </c:if>

    </div>

</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>