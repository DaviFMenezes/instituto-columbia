<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="footer-publica">

    <div class="footer-container">

        <div class="footer-marca">

            <h2>Instituto Columbia</h2>

            <p>
                Cultura, educação e transformação social através
                da arte e da inovação.
            </p>

            <h3>Contato</h3>

            <p>Email: contato@institutocolumbia.com</p>

            <p>Santa Maria - RS</p>

            <div class="footer-midias">

                <a href="https://www.instagram.com/institutocolumbia" target="_blank">
                    <i class="bi bi-instagram"></i>
                </a>

                <a href="#" target="_blank">
                    <i class="bi bi-facebook"></i>
                </a>

                <a href="https://www.youtube.com/@institutoColumbiaa" target="_blank">
                    <i class="bi bi-youtube"></i>
                </a>

            </div>
        </div>

        <div class="footer-formulario">

            <h3>Fale Conosco</h3>

            <form action="mensagem" method="post">

                <input
                        type="text"
                        name="nome"
                        class="form-control"
                        placeholder="Seu nome"
                        required>

                <input
                        type="email"
                        name="email"
                        class="form-control"
                        placeholder="Seu e-mail"
                        required>

                <input
                        type="text"
                        name="assunto"
                        class="form-control"
                        placeholder="Assunto"
                        required>

                <textarea
                        name="mensagem"
                        class="form-control"
                        placeholder="Digite sua mensagem"
                        required></textarea>

                <button type="submit">
                    Enviar Mensagem
                </button>

            </form>

            <c:if test="${not empty sucesso}">
                <p class="mensagem-sucesso">
                        ${sucesso}
                </p>
            </c:if>

            <c:if test="${not empty erro}">
                <p class="mensagem-erro">
                        ${erro}
                </p>
            </c:if>

        </div>

    </div>

    <div class="footer-bottom">

        <p>
            © 2026 Instituto Columbia
        </p>

    </div>

</footer>