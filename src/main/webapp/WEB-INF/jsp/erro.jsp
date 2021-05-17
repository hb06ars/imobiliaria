<!-- HEADER -->
<jsp:include page="pages/includes/header.jsp" />
<!-- HEADER -->
<!-- TAGS -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- TAGS -->
<!-- SCRIPT -->
<script>
function redirecionar(link){
	window.location.href=link;
}
function goBack() {
	  window.history.back();
}
</script>
<!-- SCRIPT -->



<br><br><br>
<div class="wrapper-page">
            <div class="ex-page-content text-center">
                <h2>Ops! Página não encontrada!</h2><br>
                <p class="text-muted">Página não encontrada ou ocorreu um erro.</p>
                <p class="text-muted">Clique abaixo para voltar</p>
                <br>
                <a onclick="goBack()" class="btn btn-default waves-effect waves-light" > Voltar</a>
            </div>
</div>
<br><br><br>



<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->