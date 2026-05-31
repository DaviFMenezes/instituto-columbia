
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/usuarios.css?v=2'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
</head>

<body>
<div class="page-wrapper">
    <jsp:include page="/WEB-INF/includes/header.jsp" />
    <c:choose>
        <c:when test="${param.msg == 'salvo'}">
            <div class="msg">Usuário cadastrado!</div>
        </c:when>
        <c:when test="${param.msg == 'excluido'}">
            <div class="msg">Usuário excluído!</div>
        </c:when>
        <c:when test="${param.msg == 'editado'}">
            <div class="msg">Usuário atualizado!</div>
        </c:when>
    </c:choose>
    <div class="container">
        <div class="card">
            <h2>Lista de Usuários</h2>
            <table>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Senha</th>
                    <th>Permissao</th>
                    <th>Ações</th>
                </tr>
                <c:forEach var="u" items="${usuarios}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${u.id}</td>
                        <td>${u.nome}</td>
                        <td>${u.email}</td>
                        <td>${u.senha}</td>
                        <td>${u.permissao}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/usuario?acao=editar&id=${u.id}">Editar</a>

                            <a href="${pageContext.request.contextPath}/usuario?acao=excluir&id=${u.id}" onclick="return confirm('Excluir?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="card">
            <h2>Cadastrar Usuário</h2>
            <form action="${pageContext.request.contextPath}/usuario" method="post">

                <input type="hidden" name="id" value="${usuarioForm != null ? usuarioForm.id : ''}">
                <label>Nome</label>

                <input type="text" name="nome" value="${usuarioForm != null ? usuarioForm.nome : ''}">
                <label>Email</label>

                <input type="text" name="email" value="${usuarioForm != null ? usuarioForm.email : ''}">
                <label>Senha</label>

                <input type="text" name="senha" value="${usuarioForm != null ? usuarioForm.senha : ''}">
                <label>Permissão</label>

                <select name="permissao">
                    <option value="ADMIN"${usuarioForm != null && usuarioForm.permissao == 'ADMIN' ? 'selected' : ''}>ADMIN</option>

                    <option value="EDITOR"${usuarioForm != null && usuarioForm.permissao == 'EDITOR' ? 'selected' : ''}>EDITOR</option>
                </select>


                <button type="submit">
                    ${usuarioForm.id != null ? 'Atualizar' : 'Cadastrar'}
                </button>
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