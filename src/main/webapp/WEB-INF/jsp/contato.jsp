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

    <!-- subheader begin -->
    <div id="subheader">
        <div class="container">
            <div class="row">
                <div class="span6">
                    <h1>Contato</h1>
                </div>
                <div class="span6">
                    <div class="crumb"><a href="/index" style="color:black">Home</a> <span class="separator">></span> Contato</div>
                </div>
            </div>
        </div>
    </div>
    <!-- subheader close -->

    <div id="map-container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.0658301189665!2d-46.652983985491474!3d-23.56607906765054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sAv.%20Paulista%20-%20Bela%20Vista%2C%20S%C3%A3o%20Paulo%20-%20SP!5e0!3m2!1spt-BR!2sbr!4v1620695824736!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>

    <!-- content begin -->
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="span8">
                    <h4>Imobiliária</h4>
                    Rua da Alegria 123 - Bairro Jd Felicidade<br />
                    CEP: 99999-999 - São Paulo - SP<br>
                    Contato: (11)88888-8888<br>
                    Email: imobiliaria@teste.com<br>
                    Atendimento (seg. à sex.): 08:00 às 20:00hs<br>
                    Domingos e Feriados: 09:00 às 14:00hs
                    <br />
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>
	<!-- content close -->


<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->