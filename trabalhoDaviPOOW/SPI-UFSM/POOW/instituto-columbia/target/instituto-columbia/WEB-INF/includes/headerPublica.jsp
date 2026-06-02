<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/headerPublica.css?v=<%= System.currentTimeMillis() %>">

<header class="header">

    <nav class="navbar navbar-expand-lg">

        <div class="container-fluid">

            <a class="navbar-brand logo"
               href="index.jsp">

                <img
                        src="${pageContext.request.contextPath}/images/columbia-logo.png"
                        alt="logo columbia">

            </a>

            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#menuPublico"
                    aria-controls="menuPublico"
                    aria-expanded="false"
                    aria-label="Toggle navigation">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse"
                 id="menuPublico">

                <ul class="navbar-nav mx-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Início
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Sobre
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Projetos
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#contato">
                            Contato
                        </a>
                    </li>

                </ul>

                <!-- LOGIN -->

                <a class="login-link"
                   href="${pageContext.request.contextPath}/login">

                    <button type="button"
                            class="btn-login">

                        Fazer Login

                    </button>

                </a>

            </div>

        </div>

    </nav>

</header>