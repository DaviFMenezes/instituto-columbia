<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
  <title>Login</title>
</head>
<body>
<jsp:include page="/WEB-INF/includes/header.jsp" />
<div class="container">
  <div class="box">
    <h2>Login</h2>
    <form action="login" method="post">
      <input class="form-control" type="email"  name="email" placeholder="E-mail" required>
      <input class="form-control" type="password" name="senha" placeholder="Senha" required>
      <button type="submit">Entrar</button>
    </form>

    <c:if test="${not empty erro}">
      <p style="color:red">${erro}</p>
    </c:if>
  </div>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>