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

function buscaCasa(id){
	window.location.href="/imovel_"+id;
}

function submitFormulario(){
	document.getElementById("acao").value = "pesquisar";
	document.getElementById("formulario").submit();
}


</script>
<!-- SCRIPT -->


<!-- PÁGINA -->
    <div class="clearfix"></div>


    <!-- content begin -->
    <div id="content">
        <div class="container"></div>

        <!-- paralax background -->

        <div class="container">
			<div class="row">
			    <div class="span9">
                    <c:if test="${acao == null}">
                    	<h3>Imóveis Recentes</h3>
                    </c:if>
                    <c:if test="${acao != null}">
                    	<h3>Resultados</h3>
                    </c:if>
                    <div class="row">
                        <c:forEach items="${imoveisSistema }" var="i">
	                        <div class="span3 property-item property-for-sale" style="cursor:pointer" onclick="buscaCasa(${i.id})">
	                            <div class="info-1">
	                            	<c:if test="${i.tipoPagamento != null }">
	                            		<c:forEach items="${i.tipoPagamento }" var="tp">
	                            			<c:if test="${tp.nome == 'Vender' }">
	                            				<div class="for-sale">${tp.nome }</div>
	                            			</c:if>
	                            			<c:if test="${tp.nome != 'Vender' }">
	                            				<div class="for-sale" style="background-color:#2E9AFE">${tp.nome }</div>
	                            			</c:if>
	                            		</c:forEach>
	                            	</c:if>
	                            
	                                <div class="price">
	                                    R$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${i.preco }" />
	                                </div>
	                            </div>
	                            
	                            <c:if test="${i.imagem1 == null || i.imagem1 == ''}">
	                            	 <img data-original="img/semFoto.png" alt="" src="img/semFoto.png" class="img-hover">
	                            </c:if>
	                            <c:if test="${i.imagem1 != null && i.imagem1 != ''}">
	                            	<img data-original="${i.imagem1 }" alt="" src="${i.imagem1 }" class="img-hover">
	                            </c:if>
	                            <div class="info">
	                                <p>Código: ${i.id }</p>
	                                <h4><b style="color:gray">${i.bairro }</b></h4>
	                                ${i.cidade } - ${i.estado }
	                                <div class="features">
	                                			<c:if test="${i.quartos > 0 }">
			                                    	<span class="bed">${i.quartos } &nbsp</span>
			                                    </c:if>
			                                    <c:if test="${i.tamanho > 0 }">
			                                    	<span class="area">${i.tamanho }m<sup>2</sup> </span>
			                                    </c:if>
			                                    <c:if test="${i.banheiros > 0 }">
			                                    	<span class="bath">${i.banheiros } &nbsp&nbsp</span>
			                                    </c:if>
			                                    <c:if test="${i.vagas > 0 }">
			                                    	<span class="fa fa-automobile" style="color:#999999">${i.vagas } </span>
			                                    </c:if>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                </div>



                <form class="form-horizontal m-t-20" id="formulario" action="/" method="post" accept-charset="utf-8">
	                <div class="span3">
	                  <div class="widget">
	                  	<div id="property-search">
	                    <h3><i class="icon-search icon-1x"></i>Procure aqui</h3>
	                    <div class="group"> <span class="label">Código do Imóvel</span>
	                      <input type="text" name="pesq_codigo" style="max-width:95%" value="${pesq_codigo}" autofocus/>
	                    </div>
	                    <div class="group"> <span class="label">Localização (Rua, Bairro, Cidade,etc)</span>
	                      <input type="text" name="pesq_localizacao" style="max-width:95%" value="${pesq_localizacao}"/>
	                    </div>
	                    <div class="group"> <span class="label">Tipo</span>
	                      <select name="pesq_tipoImovel">
	                        <option>Todos</option>
	                        <c:forEach items="${tipos }" var="v">
	                        	<option <c:if test="${fn:toLowerCase(pesq_tipoImovel) == fn:toLowerCase(v.nome)}">selected</c:if> >${v.nome }</option>
	                        </c:forEach>
	                      </select>
	                    </div>
	                    <div class="group"> <span class="label">Escolha</span>
	                      <select name="pesq_tipoPagamento">
	                        <option>Todos</option>
	                        <c:forEach items="${tipoPagamento }" var="v">
	                        	<option <c:if test="${fn:toLowerCase(pesq_tipoPagamento) == fn:toLowerCase(v.nome)}">selected</c:if>>${v.nome }</option>
	                        </c:forEach>
	                      </select>
	                    </div>
	                    <div class="group "> <span class="label">Tamanho m<sup>2</sup></span>
	                      <input type="number" name="pesq_tamanho" min="0" value="${pesq_tamanho }" style="max-width:95%" />
	                    </div>
	                    <div class="group half"> <span class="label">Salas</span>
	                      <select name="pesq_salas">
	                        <option>Todos</option>
	                        <option <c:if test="${pesq_salas == 1}">selected</c:if> >1</option>
	                        <option <c:if test="${pesq_salas == 2}">selected</c:if> >2</option>
	                        <option <c:if test="${pesq_salas == 3}">selected</c:if> >3</option>
	                        <option <c:if test="${pesq_salas == 4}">selected</c:if> >4</option>
	                        <option <c:if test="${pesq_salas == 5}">selected</c:if> >5</option>
	                      </select>
	                    </div>
	                    <div class="group half last"> <span class="label">Vagas</span>
	                      <select name="pesq_vagas">
	                        <option>Todos</option>
	                        <option <c:if test="${pesq_vagas == 1}">selected</c:if> >1</option>
	                        <option <c:if test="${pesq_vagas == 2}">selected</c:if> >2</option>
	                        <option <c:if test="${pesq_vagas == 3}">selected</c:if> >3</option>
	                        <option <c:if test="${pesq_vagas == 4}">selected</c:if> >4</option>
	                        <option <c:if test="${pesq_vagas == 5}">selected</c:if> >5</option>
	                      </select>
	                    </div>
	                    <div class="group half"> <span class="label">Quartos</span>
	                      <select name="pesq_quartos">
	                        <option>Todos</option>
	                        <option <c:if test="${pesq_quartos == 1}">selected</c:if> >1</option>
	                        <option <c:if test="${pesq_quartos == 2}">selected</c:if> >2</option>
	                        <option <c:if test="${pesq_quartos == 3}">selected</c:if> >3</option>
	                        <option <c:if test="${pesq_quartos == 4}">selected</c:if> >4</option>
	                        <option <c:if test="${pesq_quartos == 5}">selected</c:if> >5</option>
	                      </select>
	                    </div>
	                    <div class="group half last"> <span class="label">Banheiro</span>
	                      <select name="pesq_banheiros">
	                        <option>Todos</option>
	                        <option <c:if test="${pesq_banheiro == 1}">selected</c:if> >1</option>
	                        <option <c:if test="${pesq_banheiro == 2}">selected</c:if> >2</option>
	                        <option <c:if test="${pesq_banheiro == 3}">selected</c:if> >3</option>
	                        <option <c:if test="${pesq_banheiro == 4}">selected</c:if> >4</option>
	                        <option <c:if test="${pesq_banheiro == 5}">selected</c:if> >5</option>
	                      </select>
	                    </div>
	                    <div class="group"> <span class="label">Segurança</span>
	                    	<select name="pesq_seguranca">
		                    	<option>Todos</option>
		                        <c:forEach items="${segurancaLista }" var="v">
		                        	<option <c:if test="${fn:toLowerCase(pesq_seguranca) == fn:toLowerCase(v.nome)}">selected</c:if> >${v.nome }</option>
		                        </c:forEach>
	                        </select>
	                    </div>
	                    <div class="group half"> <span class="label">Comodidades</span>
	                    	<select name="pesq_comodidades">
		                    	<option>Todos</option>
		                        <c:forEach items="${comodidadeLista }" var="v">
		                        	<option <c:if test="${fn:toLowerCase(pesq_comodidades) == fn:toLowerCase(v.nome)}">selected</c:if> >${v.nome }</option>
		                        </c:forEach>
	                        </select>
	                    </div>
	                    <div class="group half last"> <span class="label">Lazer</span>
	                    	<select name="pesq_lazer">
		                    	<option>Todos</option>
		                        <c:forEach items="${lazerLista }" var="v">
		                        	<option <c:if test="${fn:toLowerCase(pesq_lazer) == fn:toLowerCase(v.nome)}">selected</c:if> >${v.nome }</option>
		                        </c:forEach>
	                        </select>
	                    </div>
	                    <div class="group half"> <span class="label">Preço de</span>
	                      <select name="pesq_precoDe">
	                        <option>Mínimo</option>
	                        <option <c:if test="${pesq_precoDe == '50.000'}">selected</c:if> >50.000</option>
	                        <option <c:if test="${pesq_precoDe == '100.000'}">selected</c:if> >100.000</option>
	                        <option <c:if test="${pesq_precoDe == '150.000'}">selected</c:if> >150.000</option>
	                        <option <c:if test="${pesq_precoDe == '200.000'}">selected</c:if> >200.000</option>
	                        <option <c:if test="${pesq_precoDe == '250.000'}">selected</c:if> >250.000</option>
	                        <option <c:if test="${pesq_precoDe == '300.000'}">selected</c:if> >300.000</option>
	                        <option <c:if test="${pesq_precoDe == '350.000'}">selected</c:if> >350.000</option>
	                        <option <c:if test="${pesq_precoDe == '400.000'}">selected</c:if> >400.000</option>
	                        <option <c:if test="${pesq_precoDe == '450.000'}">selected</c:if> >450.000</option>
	                        <option <c:if test="${pesq_precoDe == '500.000'}">selected</c:if> >500.000</option>
	                      </select>
	                    </div>
	                    <div class="group half last"> <span class="label">Preço Até</span>
	                      <select name="pesq_precoAte">
	                        <option>Máximo</option>
	                        <option <c:if test="${pesq_precoDe == '50.000'}">selected</c:if> >50.000</option>
	                        <option <c:if test="${pesq_precoDe == '100.000'}">selected</c:if> >100.000</option>
	                        <option <c:if test="${pesq_precoDe == '150.000'}">selected</c:if> >150.000</option>
	                        <option <c:if test="${pesq_precoDe == '200.000'}">selected</c:if> >200.000</option>
	                        <option <c:if test="${pesq_precoDe == '250.000'}">selected</c:if> >250.000</option>
	                        <option <c:if test="${pesq_precoDe == '300.000'}">selected</c:if> >300.000</option>
	                        <option <c:if test="${pesq_precoDe == '350.000'}">selected</c:if> >350.000</option>
	                        <option <c:if test="${pesq_precoDe == '400.000'}">selected</c:if> >400.000</option>
	                        <option <c:if test="${pesq_precoDe == '450.000'}">selected</c:if> >450.000</option>
	                        <option <c:if test="${pesq_precoDe == '500.000'}">selected</c:if> >500.000</option>
	                      </select>
	                    </div>
	                    <input type="button" value="Pesquisar" class="btn btn-info" onclick="submitFormulario()">
	                    <input type="reset" value="Limpar" class="btn btn-danger">
	                    <input type="hidden" name="acao" id="acao" class="btn btn-primary">
	                    <div class="clearfix"></div>
	                  </div>
	                  </div>
	                </div>
                </form>
                
                
                
                
            </div>

		
        

 		<hr class="blank">   
    

    </div>
    <!-- content close -->
<!-- PÁGINA -->



<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->