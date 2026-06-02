<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footerPublica.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
  <title>Login</title>
</head>
<body class="login-body">

<header class="login-header">

  <a href="${pageContext.request.contextPath}/">

    <img
            src="${pageContext.request.contextPath}/images/columbia-logo.png"
            alt="Logo Instituto Columbia">

  </a>

</header>

<main class="login-container">

  <div class="login-box">

    <h2>Login</h2>

    <form action="login" method="post">

      <input
              class="form-control"
              type="email"
              name="email"
              placeholder="E-mail"
              required>

      <input
              class="form-control"
              type="password"
              name="senha"
              placeholder="Senha"
              required>

      <button type="submit">
        Entrar
      </button>

    </form>

    <a class="voltar" href="${pageContext.request.contextPath}/">Voltar ao site</a>

  </div>

</main>

</body>
</html>