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

    <title>Projetos - Instituto Columbia</title>
</head>

<body>

<jsp:include page="includes/headerPublica.jsp" />

<section class="intro compact-intro">
    <h1>Projetos</h1>
    <p>Conheca as iniciativas culturais e esportivas cadastradas pelo Instituto Columbia.</p>
</section>

<main class="public-projects">
    <div class="section-heading">
        <span>Instituto Columbia</span>
        <h2>Todos os projetos</h2>
    </div>

    <c:choose>
        <c:when test="${empty projetos}">
            <div class="empty-state">
                <h3>Nenhum projeto cadastrado ainda.</h3>
                <p>Assim que novos projetos forem registrados, eles aparecerao aqui.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="project-grid">
                <c:forEach var="p" items="${projetos}">
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

                            <div class="project-dates">
                                <span>Inicio: ${p.dataInicio}</span>
                                <c:if test="${not empty p.dataTermino}">
                                    <span>Termino: ${p.dataTermino}</span>
                                </c:if>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<section id="contato">
    <jsp:include page="includes/footerPublica.jsp" />
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
