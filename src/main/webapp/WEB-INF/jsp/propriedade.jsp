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

function submitFormulario(){
	document.getElementById("acao").value = "pesquisar";
	document.getElementById("formulario").submit();
}

</script>
<!-- SCRIPT -->


    <!-- subheader begin -->
    <div id="subheader">
        <div class="container">
            <div class="row">
                <div class="span6">
                    <h1><b>Código: ${imovel.id }</b></h1>
                </div>
                <div class="span6">
                    <div class="crumb"><a href="/" style="color:black">Home</a> <span class="separator"></span> Imóvel</div>
                </div>
            </div>
        </div>
    </div>
    <!-- subheader close -->

    <!-- content begin -->
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="span9">
                    <div class="row single-property">
                        <div class="span6">
                            <div class="flexslider main-slider">
                                <ul class="slides">
                                	<c:if test="${imovel.imagem1 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem1 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem2 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem2 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem3 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem3 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem4 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem4 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem5 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem5 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem6 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem6 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem7 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem7 }" alt="">
	                                    </li>
                                    </c:if>
                                    <c:if test="${imovel.imagem8 != null}">
	                                    <li>
	                                        <img src="${imovel.imagem8 }" alt="">
	                                    </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>

                        <div class="span3">
                            <c:if test="${imovel.tipoPagamento != null }">
                            	<c:forEach items="${imovel.tipoPagamento }" var="tp" >
                            		<c:if test="${tp.nome != 'Vender' }">
                            			<span class="for-sale">${tp.nome }</span>
                            		</c:if>
                            		<c:if test="${tp.nome == 'Vender' }">
                            			<span class="for-sale" style="background-color:#2E9AFE">${tp.nome }</span>
                            		</c:if>
                            	</c:forEach>
	                        </c:if>
                            <h3 class="no-btm">${imovel.rua }</h3>
                            ${imovel.bairro }<br>
                            (${imovel.statusImovel.nome })
                          <span class="price">
						  	R$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${imovel.preco }" />
						  </span>
						  <c:if test="${imovel.condominio > 0}">
							  <span>
							  	Condomínio R$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${imovel.condominio }" />
							  </span>
						  </c:if>

                            <ul class="feature-list">
                            	<c:if test="${imovel.tamanho > 0 }">
                            		<li>Tamanho: ${imovel.tamanho } m<sup>2</sup></li>
                            	</c:if>
                            	<c:if test="${imovel.quartos > 0 }">
                            		<li>${imovel.quartos } Quarto(s)</li>
                            	</c:if>
                            	<c:if test="${imovel.vagas > 0 }">
                            		<li>${imovel.vagas } Vaga(s)</li>
                            	</c:if>
                            	<c:if test="${imovel.salas > 0 }">
                            		<li>${imovel.salas } Sala(s)</li>
                            	</c:if>
                            	<c:if test="${imovel.banheiros > 0 }">
                            		<li>${imovel.banheiros } Banheiros(s)</li>
                            	</c:if>
                            	
                            	
                            	<c:if test="${imovel.comodidade != null }">
                            		<c:forEach items="${imovel.comodidade }" var="obj">
                            			<li>${obj.nome }</li>
                            		</c:forEach>
                            	</c:if>
                            	<c:if test="${imovel.lazer != null }">
                            		<c:forEach items="${imovel.lazer }" var="obj">
                            			<li>${obj.nome }</li>
                            		</c:forEach>
                            	</c:if>
                            	<c:if test="${imovel.seguranca != null }">
                            		<c:forEach items="${imovel.seguranca }" var="seg">
                            			<li>${seg.nome }</li>
                            		</c:forEach>
                            	</c:if>
                            	
                            	
                            </ul>
                        </div>

                    </div>

                    <hr class="blank">

                    <div class="lt_tab">
                        <ul class="lt_nav">
                            <li><span class="active">Informações</span></li>
                            <li><span class="">Observações</span></li>
                            <li><span>Ver no Mapa</span></li>
                            <li><span>Contato</span></li>
                        </ul>
                        <div class="lt_tab_content">

                            <div id="tab1" class="lt_content">
                               <b>Código do Imóvel: ${imovel.id }</b> <br>
                               Disponível: <c:if test="${imovel.disponivel }">Sim</c:if> <c:if test="${!imovel.disponivel }">Não</c:if> <br>
                               Imobiliária: 
                               <c:if test="${imovel.imobiliaria != null }">
                               	<c:forEach items="${imovel.imobiliaria}" var="obj" varStatus="count">
                               		<c:if test="${count.index > 0}">,</c:if> &nbsp${obj.nome} - ${obj.contato} (${obj.responsavel})
                               	</c:forEach>
                               </c:if>
                               <br>
                               
                               Aluguel / Venda: 
                               <c:if test="${imovel.tipoPagamento != null }">
                               	<c:forEach items="${imovel.tipoPagamento}" var="obj" varStatus="count">
                               		<c:if test="${count.index > 0}">,</c:if> &nbsp${obj.nome} 
                               	</c:forEach>
                               </c:if>
                               <br>
                               
                               <c:if test="${imovel.categoria != null}">
                               	Categoria: ${imovel.categoria.nome} <br>
                               </c:if>
                               
                               <c:if test="${imovel.tipoImovel != null}">
                               	Tipo: ${imovel.tipoImovel.nome} <br>
                               </c:if>
                               
                               <c:if test="${imovel.statusImovel != null}">
                               	Status: ${imovel.statusImovel.nome} <br>
                               </c:if>
                               
                               
                               <c:if test="${imovel.tamanho != null}">
                               	Tamanho: ${imovel.tamanho}m<sup>2</sup> <br>
                               </c:if>
                               <c:if test="${imovel.salas != null}">
                               	Sala: ${imovel.salas}<br>
                               </c:if>
                               <c:if test="${imovel.quartos != null}">
                               	Quartos: ${imovel.quartos}<br>
                               </c:if>
                               <c:if test="${imovel.vagas != null}">
                               	Vagas: ${imovel.vagas}<br>
                               </c:if>
                               <c:if test="${imovel.banheiros != null}">
                               	Banheiros: ${imovel.banheiros}<br>
                               </c:if>
                               
                               
                               
                               


                               Segurança: 
                               <c:if test="${imovel.seguranca != null }">
                               	<c:forEach items="${imovel.seguranca}" var="obj" varStatus="count">
                               		<c:if test="${count.index > 0}">,</c:if>
                               			&nbsp${obj.nome}
                               	</c:forEach>
                               </c:if>
                               <br>

                               Comodidades:
                                <c:if test="${imovel.comodidade != null }">
                               	<c:forEach items="${imovel.comodidade}" var="obj" varStatus="count">
                               		<c:if test="${count.index > 0}">,</c:if>
                               			&nbsp${obj.nome}
                               	</c:forEach>
                               </c:if>
                               <br>

                               Lazer: 
                                <c:if test="${imovel.lazer != null }">
                               	<c:forEach items="${imovel.lazer}" var="obj" varStatus="count">
                               		<c:if test="${count.index > 0}">,</c:if>
                               			&nbsp${obj.nome}
                               	</c:forEach>
                               </c:if>
                               <br>
                               <c:if test="${imovel.cep != null}">
                               	CEP: ${imovel.cep} <br>
                               </c:if>
                               <c:if test="${imovel.cidade != null}">
                               	Cidade: ${imovel.cidade} <br>
                               </c:if>
                               <c:if test="${imovel.estado != null}">
                               	Estado: ${imovel.estado} <br>
                               </c:if>
                               <c:if test="${imovel.preco != null}">
                               	Preço: R$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${imovel.preco }" /><br>
                               </c:if>
                               <c:if test="${imovel.condominio != null}">
                               	Condomínio: R$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${imovel.condominio }" /><br>
                               </c:if>
                               <c:if test="${imovel.dataCadastro != null}">
                               	Data de Cadastro: <fmt:formatDate pattern="dd/MM/yyyy" value="${imovel.dataCadastro }" /><br>
                               </c:if>
                            </div>
                            
                            <div id="tab2" class="lt_content">
                                ${imovel.descricao }
                            </div>

                            <div id="tab3" class="lt_content">
                                <div class="map-tab">
                                	<c:if test="${imovel.enderecoGoogleMap != null}">
                                    	<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="${imovel.enderecoGoogleMap }"></iframe>
                                    </c:if>
                                    <c:if test="${imovel.enderecoGoogleMap == null}">
										URL do Google Maps não cadastrado.
									</c:if>
                                </div>
                            </div>

                            <div id="tab4" class="lt_content">
                                <div class="agent-tab">
                                    <img src="img/avatar.jpg" alt="">
                                    <div class="info">
                                        <h4>${imovel.responsavel}</h4>
                                        <span>Tel: ${imovel.contatoResponsavel}</span>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                    </div>


                </div>
                
                
                <form class="form-horizontal m-t-20" id="formulario" action="/" method="post" accept-charset="utf-8">
	                <div class="span3">
	                  <div class="widget">
	                  	<div id="property-search">
	                    <h3><i class="icon-search icon-1x"></i>Procure aqui</h3>
	                    <div class="group"> <span class="label">Código do Imóvel</span>
	                      <input type="text" name="pesq_codigo" style="max-width:95%" value="${pesq_codigo}"/>
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
        </div>
    </div>
    <!-- content close -->

    <!-- footer begin -->

    
 <!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->