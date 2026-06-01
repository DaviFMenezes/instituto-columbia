<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mensagens.css?v=1'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
</head>

<body>
<div class="page-wrapper">
    <jsp:include page="/WEB-INF/includes/header.jsp" />


    <c:choose>
        <c:when test="${param.msg == 'salvo'}">
            <div class="msg">Mensagem cadastrada!</div>
        </c:when>
        <c:when test="${param.msg == 'excluido'}">
            <div class="msg">Mensagem excluída!</div>
        </c:when>
        <c:when test="${param.msg == 'editado'}">
            <div class="msg">Mensagem atualizada!</div>
        </c:when>
    </c:choose>

    <div class="container" style="display: flex; gap: 20px;">

        <div class="card" style="flex: 2;">
            <h2>Lista de Mensagens</h2>
            <table>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Assunto</th>
                    <th>Mensagem</th>
                    <th>Ações</th>
                </tr>
                <c:forEach var="m" items="${mensagens}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${m.id}</td>
                        <td>${m.nome}</td>
                        <td>${m.email}</td>
                        <td>${m.assunto}</td>
                        <td>${m.mensagem}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/mensagem?acao=editar&id=${m.id}">Editar</a>
                            <a href="${pageContext.request.contextPath}/mensagem?acao=excluir&id=${m.id}" onclick="return confirm('Excluir?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <div class="card" style="flex: 1;">
            <h2>${mensagemEditar != null ? 'Editar Mensagem' : 'Cadastrar Mensagem'}</h2>
            <form action="${pageContext.request.contextPath}/mensagem" method="post">


                <input type="hidden" name="id" value="${mensagemEditar != null ? mensagemEditar.id : ''}">

                <label>Nome</label>
                <input type="text" name="nome" value="${mensagemEditar != null ? mensagemEditar.nome : ''}" required>

                <label>Email</label>
                <input type="email" name="email" value="${mensagemEditar != null ? mensagemEditar.email : ''}" required>

                <label>Assunto</label>
                <input type="text" name="assunto" value="${mensagemEditar != null ? mensagemEditar.assunto : ''}">

                <label>Mensagem</label>
                <textarea name="mensagem" required>${mensagemEditar != null ? mensagemEditar.mensagem : ''}</textarea>

                <button type="submit">
                    ${mensagemEditar != null ? 'Atualizar' : 'Cadastrar'}
                </button>
                <c:if test="${mensagemEditar != null}">
                    <a href="${pageContext.request.contextPath}/mensagem" style="display:block; margin-top:10px; text-align:center;">Cancelar</a>
                </c:if>
            </form>
        </div>
    </div>

    <c:if test="${sessionScope.usuario.permissao == 'ADMIN'}">
        <div class="container-voltar">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn-dashboard">Voltar</a>
        </div>
    </c:if>

    <jsp:include page="/WEB-INF/includes/footer.jsp" />
</div>
</body>
</html>
