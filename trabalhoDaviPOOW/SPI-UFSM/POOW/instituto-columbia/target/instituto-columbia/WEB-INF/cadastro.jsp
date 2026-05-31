<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/cadastro.css?v=1'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
</head>
<body>

<jsp:include page="/WEB-INF/includes/header.jsp" />

<div class="page-center">
    <div class="box">
        <h2>👤 Criar Conta</h2>
        <form action="${pageContext.request.contextPath}/usuario" method="post">
            <input type="text" name="nome" placeholder="Nome" required>
            <input type="email" name="email" placeholder="E-mail" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <button type="submit">Cadastrar</button>
        </form>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-back">Voltar</a>
    </div>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
