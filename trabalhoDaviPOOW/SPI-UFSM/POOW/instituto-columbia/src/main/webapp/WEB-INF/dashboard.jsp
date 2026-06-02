<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/headerAdmin.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css?v=1'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footerAdmin.css'/>">
</head>

<body>

<div class="page-wrapper">

    <jsp:include page="/WEB-INF/includes/headerAdmin.jsp" />


    <c:if test="${sessionScope.usuario == null}">
        <c:redirect url="/index.jsp"/>
    </c:if>

    <div class="dashboard-container">

        <h1>Bem-vindo, ${sessionScope.usuario.nome}</h1>

        <p class="subtitle">
            Painel administrativo do Instituto Columbia
        </p>


        <div class="cards">

            <div class="card">
                <h3>Projetos</h3>
                <p>Gerenciar projetos cadastrados</p>
                <a href="projeto">Acessar</a>
            </div>

            <div class="card">
                <h3>Mensagens</h3>
                <p>Ver mensagens enviadas pelo site</p>
                <a href="mensagem">Acessar</a>
            </div>

            <c:if test="${sessionScope.usuario.permissao == 'ADMIN'}">
                <div class="card admin">
                    <h3>Usuários</h3>
                    <p>Gerenciar usuários do sistema</p>
                    <a href="usuario">Acessar</a>
                </div>
            </c:if>

        </div>

    </div>

    <jsp:include page="/WEB-INF/includes/footerAdmin.jsp" />

</div>

</body>
</html>