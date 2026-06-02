<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/headerAdmin.css?v=1">

<header class="header-admin">

    <div class="logo-admin">

        <img
                src="${pageContext.request.contextPath}/images/columbia-logo.png"
                alt="logo columbia">

    </div>

    <div class="usuario-admin">

        <c:if test="${not empty sessionScope.usuario}">

            Olá, ${sessionScope.usuario.nome} |

            <a href="logout">
                Sair
            </a>

        </c:if>

    </div>

</header>