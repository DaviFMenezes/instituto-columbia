<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/projetos.css?v=5'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/footerAdmin.css'/>">
</head>

<body>

<div class="page-wrapper">

  <jsp:include page="/WEB-INF/includes/headerAdmin.jsp" />

  <c:choose>
    <c:when test="${param.msg == 'salvo'}">
      <div class="msg">Projeto cadastrado!</div>
    </c:when>

    <c:when test="${param.msg == 'excluido'}">
      <div class="msg">Projeto excluido!</div>
    </c:when>

    <c:when test="${param.msg == 'editado'}">
      <div class="msg">Projeto atualizado!</div>
    </c:when>
  </c:choose>

  <div class="container-projetos">

    <div class="projects-feed">

      <div class="feed-header">
        <h1>Projetos</h1>
        <p>Gerencie todos os projetos cadastrados</p>
      </div>

      <c:forEach var="p" items="${projetos}" varStatus="status">

        <div class="project-card">

          <div class="project-top">

            <div>
              <span class="project-number">#${status.index + 1}</span>
              <h2>${p.titulo}</h2>
            </div>

            <span class="project-category">${p.categoria}</span>

          </div>

          <div class="project-description">
            ${p.descricao}
          </div>

          <div class="project-info">

            <div class="info-item">
              <strong>ID:</strong>
              ${p.id}
            </div>

            <div class="info-item">
              <strong>Criador:</strong>
              ${p.id_usuario}
            </div>

            <div class="info-item">
              <strong>Inicio:</strong>
              ${p.dataInicio}
            </div>

            <div class="info-item">
              <strong>Termino:</strong>
              ${p.dataTermino}
            </div>

          </div>

          <c:if test="${not empty p.imagemUrl}">
            <div class="project-image">
              <c:url var="imagemProjetoAdmin" value="${p.imagemUrl}" />
              <img src="${imagemProjetoAdmin}" alt="Imagem do projeto ${p.titulo}">
              <span>${p.imagemUrl}</span>
            </div>
          </c:if>

          <c:if test="${sessionScope.usuario.id == p.id_usuario || sessionScope.usuario.permissao == 'ADMIN'}">

            <div class="project-actions">

              <a href="projeto?acao=editar&id=${p.id}" class="btn-edit">Editar</a>

              <a href="projeto?acao=excluir&id=${p.id}" class="btn-delete" onclick="return confirm('Excluir?')">
                Excluir
              </a>

            </div>

          </c:if>

        </div>

      </c:forEach>

    </div>

    <div class="project-form-wrapper">

      <div class="project-form-card">

        <h2>
          ${projeto.id != null ? 'Editar Projeto' : 'Novo Projeto'}
        </h2>

        <form action="projeto" method="post" enctype="multipart/form-data">

          <input type="hidden" class="form-control" name="id" value="${projeto.id}">

          <label>Titulo</label>
          <input type="text" class="form-control" name="titulo" value="${projeto.titulo}">

          <label>Descricao</label>
          <textarea class="form-control" name="descricao" rows="6">${projeto.descricao}</textarea>

          <label>Categoria</label>
          <select class="form-control" name="categoria">
            <option value="Cultura"${projeto != null && projeto.categoria == 'Cultura' ? 'selected' : ''}>
              Cultura
            </option>

            <option value="Esporte"${projeto != null && projeto.categoria == 'Esporte' ? 'selected' : ''}>
              Esporte
            </option>
          </select>

          <label>Imagem do projeto</label>
          <input type="hidden" name="imagemAtual" value="${projeto.imagemUrl}">
          <input type="file" class="form-control" name="imagemArquivo" accept="image/*">

          <c:if test="${not empty projeto.imagemUrl}">
            <div class="current-image">
              <c:url var="imagemAtualPreview" value="${projeto.imagemUrl}" />
              <img src="${imagemAtualPreview}" alt="Imagem atual do projeto">
              <span>Imagem atual: ${projeto.imagemUrl}</span>
            </div>
          </c:if>

          <label>Data de Inicio</label>
          <input type="date" class="form-control" name="dataInicio" value="${projeto.dataInicio}">

          <label>Data de Termino</label>
          <input type="date" class="form-control" name="dataTermino" value="${projeto.dataTermino}">

          <button type="submit">
            ${projeto.id != null ? 'Atualizar' : 'Cadastrar'}
          </button>

        </form>

      </div>

    </div>

  </div>

  <c:if test="${sessionScope.usuario.permissao == 'ADMIN'}">

    <div class="container-voltar">

      <a href="${pageContext.request.contextPath}/dashboard"
         class="btn-dashboard">
        Voltar
      </a>

    </div>

  </c:if>

  <jsp:include page="/WEB-INF/includes/footerAdmin.jsp" />

</div>

</body>
</html>