<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/projetos.css?v=3'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
</head>

<body>

<div class="page-wrapper">

  <jsp:include page="/WEB-INF/includes/header.jsp" />

  <c:choose>
    <c:when test="${param.msg == 'salvo'}">
      <div class="msg">Projeto cadastrado!</div>
    </c:when>

    <c:when test="${param.msg == 'excluido'}">
      <div class="msg">Projeto excluído!</div>
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
                            <span class="project-number">
                              #${status.index + 1}
                            </span>

              <h2>${p.titulo}</h2>
            </div>

            <span class="project-category">
                ${p.categoria}
            </span>

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
              <strong>Início:</strong>
                ${p.dataInicio}
            </div>

            <div class="info-item">
              <strong>Término:</strong>
                ${p.dataTermino}
            </div>

          </div>

          <div class="project-image">
            <strong>Imagem:</strong>
              ${p.imagemUrl}
          </div>

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

        <form action="projeto" method="post">

          <input type="hidden" class="form-control" name="id" value="${projeto.id}">
          <label>Título</label>

          <input type="text" class="form-control" name="titulo" value="${projeto.titulo}">
          <label>Descrição</label>

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
          <label>Imagem URL</label>

          <input type="text" class="form-control" name="imagemUrl" value="${projeto.imagemUrl}">
          <label>Data de Início</label>

          <input type="date" class="form-control" name="dataInicio" value="${projeto.dataInicio}">
          <label>Data de Término</label>

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

  <jsp:include page="/WEB-INF/includes/footer.jsp" />

</div>

</body>
</html>