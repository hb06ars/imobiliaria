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
</script>
<!-- SCRIPT -->



<br><br><br>
<form action="/login" method="post" accept-charset="utf-8">
<div class="wrapper-page">
            <div class="ex-page-content text-center">
            	<c:if test="${correto == null }">
	                <h2>Área do Usuário</h2><br>
	                <p class="text-muted">Login:</p><input type="text" name="login" autofocus required/>
	                <p class="text-muted">Senha:</p><input type="text" name="senha" required/>
	                <p>
	                <button type="submit" class="btn btn-default waves-effect waves-light" >Entrar</button>
	                <c:if test="${incorreto != null }">
						<p style="color:red">
		                	${incorreto }
		                </p>
	                </c:if>
                </c:if>
                <c:if test="${correto != null }">
                	<h2>${correto }</h2><br>
                </c:if>
                
            </div>
</div>
</form>
<br><br><br>



<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->