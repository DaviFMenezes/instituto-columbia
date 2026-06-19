<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="service.ProjetoService" %>

<%
    try {
        request.setAttribute("projetosDestaque", new ProjetoService().listar());
    } catch (RuntimeException e) {
        request.setAttribute("projetosDestaque", java.util.Collections.emptyList());
    }
%>

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
    <h1>Nossa historia se faz com cultura e esporte.</h1>
</section>

<section class="home-projects">
    <div class="section-heading">
        <span>Projetos</span>
        <h2>Iniciativas em destaque</h2>
        <p>Alguns dos projetos cadastrados pelo instituto.</p>
    </div>

    <c:choose>
        <c:when test="${empty projetosDestaque}">
            <div class="empty-state">
                <h3>Nenhum projeto cadastrado ainda.</h3>
                <p>Volte em breve para conhecer as novas iniciativas.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="project-grid project-grid-home">
                <c:forEach var="p" items="${projetosDestaque}" varStatus="status">
                    <c:if test="${status.index lt 3}">
                        <article class="public-project-card">
                            <c:choose>
                                <c:when test="${not empty p.imagemUrl}">
                                    <c:url var="imagemProjeto" value="${p.imagemUrl}" />
                                    <img src="${imagemProjeto}" alt="Imagem do projeto ${p.titulo}">
                                </c:when>
                                <c:otherwise>
                                    <div class="project-image-placeholder">
                                        <span>${p.categoria}</span>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="public-project-content">
                                <span class="project-category">${p.categoria}</span>
                                <h3>${p.titulo}</h3>
                                <p>${p.descricao}</p>
                            </div>
                        </article>
                    </c:if>
                </c:forEach>
            </div>

            <a class="projects-link" href="${pageContext.request.contextPath}/projetosPublica.jsp">
                Ver todos os projetos
            </a>
        </c:otherwise>
    </c:choose>
</section>

<section id="contato">
    <jsp:include page="/WEB-INF/includes/footerPublica.jsp" />
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
