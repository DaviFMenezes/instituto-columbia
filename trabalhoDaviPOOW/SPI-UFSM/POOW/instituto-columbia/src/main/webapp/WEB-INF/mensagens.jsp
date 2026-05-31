
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

    <div class="container">
        <div class="card">
            <h2>Lista de Mensagens</h2>
            <table>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Assunto</th>
                    <th>Mensagem</th>
                    <th>Data de Envio</th>
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
                        <td>${m.dataEnvio}</td>
                        <td>
                            <a href="mensagem?acao=excluir&id=${m.id}" onclick="return confirm('Excluir?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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