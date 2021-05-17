<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


    <!-- footer begin -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h3>Imobiliária</h3>
                    <div id="logo">
                        <div class="inner">
                            <a href="index.html">
                                <img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <h3>News</h3>
                    <c:if test="${news.size() == 0 }">Nenhum recado da imobiliária.</c:if>
                    <c:forEach items="${news }" var="n">
                    	<i class="fa fa-check" aria-hidden="true"></i> ${n.data }: ${n.descricao }<br>
                    </c:forEach> 
                </div>
                <div class="span3">
                    <h3>Endereço</h3>
                    <address>
                        Rua da Alegria, 123, Bairro da Felicidade
                        <span><strong>Tel:</strong>(11) 9999-9999</span>
                        <span><strong>Cel:</strong><a href="https://wa.me/5511999999999"> (11) 99999-9999 </a></span>
                        <span><strong>Email:</strong><a href="mailto:email@teste.com">email@teste.com</a></span>
                    </address>

                    <div class="social-icons">
                        <a href="#"><img src="img/social-icons/facebook.png" alt=""></a>
                        <a href="#"><img src="img/social-icons/instagram.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="subfooter">
            <div class="container">
                <div class="row">
                    <div class="span6">
                        &copy; Todos os Direitos reservados 2021 - Imobiliária
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- footer close -->

<!-- SELECT 2 -->
<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="assets/vendor/select2/select2.js"></script>
<script src="assets/javascripts/theme.js"></script>
<script src="assets/javascripts/theme.init.js"></script>
<!-- SELECT 2 -->

<!-- TABLE -->
<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
<script src="assets/javascripts/tables/examples.datatables.default.js"></script>
<script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>
<script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>

<!-- TABLE  -->


<c:if test="${atualizarPagina != null }">
	<script>window.location.href='${atualizarPagina}';</script>
</c:if>

<jsp:include page="modal.jsp" />


</body>
</html>
