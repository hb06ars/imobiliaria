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
<!-- INICIO BODY -->


<script>



function filtra() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("search");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("dados");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}


function submitImovel(){
	document.getElementById("acao").value = "atualizar";
	document.getElementById("formImovel").submit();
}


function fMasc(objeto,mascara) {
	obj=objeto
	masc=mascara
	setTimeout("fMascEx()",1)
}
function fMascEx() {
	obj.value=masc(obj.value)
}
function mTel(tel) {
	tel=tel.replace(/\D/g,"")
	tel=tel.replace(/^(\d)/,"($1")
	tel=tel.replace(/(.{3})(\d)/,"$1)$2")
	if(tel.length == 9) {
		tel=tel.replace(/(.{1})$/,"-$1")
	} else if (tel.length == 10) {
		tel=tel.replace(/(.{2})$/,"-$1")
	} else if (tel.length == 11) {
		tel=tel.replace(/(.{3})$/,"-$1")
	} else if (tel.length == 12) {
		tel=tel.replace(/(.{4})$/,"-$1")
	} else if (tel.length > 12) {
		tel=tel.replace(/(.{4})$/,"-$1")
	}
	return tel;
}
function mCNPJ(cnpj){
	cnpj=cnpj.replace(/\D/g,"")
	cnpj=cnpj.replace(/^(\d{2})(\d)/,"$1.$2")
	cnpj=cnpj.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
	cnpj=cnpj.replace(/\.(\d{3})(\d)/,".$1/$2")
	cnpj=cnpj.replace(/(\d{4})(\d)/,"$1-$2")
	return cnpj
}
function mCPF(cpf){
	cpf=cpf.replace(/\D/g,"")
	cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
	cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
	cpf=cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
	return cpf
}
function mCEP(cep){
	cep=cep.replace(/\D/g,"")
	cep=cep.replace(/^(\d{5})(\d)/,"$1-$2")
	return cep
}
function mNum(num){
	num=num.replace(/\D/g,"")
	return num
}

function acao(valor){
	//document.getElementById("acao").value = valor;
}




</script>


<c:if test="${usuario != null}">


<form action="/cadastrar_imoveis" id="formImovel" method="post" accept-charset="utf-8">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Pesquisa do Im?vel</h2><br>
		</div>
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="span3"><label>Respons?vel pelo Im?vel:</label><input value="${imoveis.responsavel }" name="responsavel" id="responsavel" type="text" placeholder="Respons?vel" /></div> 
					<div class="span3"><label>Contato Respons?vel:</label><input value="${imoveis.contatoResponsavel }" name="contatoResponsavel" id="contatoResponsavel" type="text" maxlength="14" minlength="13" onkeydown="javascript: fMasc( this, mTel );" placeholder="Contato Respons?vel" /></div> 
					
					<div class="span3"><label>Status Im?vel:</label>
					<select name="statusImovel" id="statusImovel" >
						<c:forEach items="${statusImovel }" var="o">
							<option <c:if test="${imoveis.statusImovel.id == o.id }">selected</c:if> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Tipo Im?vel:</label>
					<select name="tipoImovel" id="tipoImovel" >
						<c:forEach items="${tipoImovel }" var="o">
							<option <c:if test="${imoveis.tipoImovel.id == o.id }">selected</c:if> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Categoria:</label>
					<select name="categoria" id="categoria" >
						<c:forEach items="${categorias }" var="o">
							<option <c:if test="${imoveis.categoria.id == o.id }">selected</c:if> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 					

					<div class="span3"><label>Descri??o:</label><input value="${imoveis.descricao }" name="descricao" id="descricao" type="text" placeholder="Descri??o" /></div> 
					
					<div class="span3"><label>Bairro:</label><input value="${imoveis.bairro }" name="bairro" id="bairro" type="text" placeholder="Bairro" required/></div>
					
					<div class="span3"><label>Banheiros:</label>
					<select name="banheiros" id="banheiros" >
							<option <c:if test="${imoveis.banheiros == 0 }">selected</c:if> value="0">0</option>
							<option <c:if test="${imoveis.banheiros == 1 }">selected</c:if> value="1">1</option>
							<option <c:if test="${imoveis.banheiros == 2 }">selected</c:if> value="2">2</option>
							<option <c:if test="${imoveis.banheiros == 3 }">selected</c:if> value="3">3</option>
							<option <c:if test="${imoveis.banheiros == 4 }">selected</c:if> value="4">4</option>
							<option <c:if test="${imoveis.banheiros == 5 }">selected</c:if> value="5">5</option>
						</select>
					</div> 
 
					<div class="span3"><label>CEP:</label><input value="${imoveis.cep }" name="cep" id="cep" type="text" maxlength="9" minlength="9" onkeydown="javascript: fMasc( this, mCEP );" placeholder="CEP" required/></div> 
					<div class="span3"><label>Cidade<span id="cidadeAtual"></span>:</label>
					<select class="span2" name="cidade" id="cidade" required data-plugin-selectTwo data-plugin-options='{ "placeholder": "Selecione um Estado", "allowClear": true }'>
						<c:forEach items="${cidades }" var="o">
							<option <c:if test="${imoveis.cidade == o.cidade }">selected</c:if> value="${o.cidade }" >${o.cidade }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Estado<span id="estadoAtual"></span>:</label>
					<select class="span2" name="estado" required id="estado" data-plugin-selectTwo data-plugin-options='{ "placeholder": "Selecione um Estado", "allowClear": true }'>
						<optgroup label="Centro-Oeste">
							<option <c:if test="${imoveis.estado == 'Goi?s' }">selected</c:if> value="Goi?s">Goi?s</option>
							<option <c:if test="${imoveis.estado == 'Mato Grosso' }">selected</c:if> value="Mato Grosso">Mato Grosso</option>
							<option <c:if test="${imoveis.estado == 'Mato Grosso do Sul' }">selected</c:if> value="Mato Grosso do Sul">Mato Grosso do Sul</option>
						</optgroup>
						<optgroup label="Nordeste">
							<option <c:if test="${imoveis.estado == 'Alagoas' }">selected</c:if> value="Alagoas">Alagoas</option>
							<option <c:if test="${imoveis.estado == 'Bahia' }">selected</c:if> value="Bahia">Bahia</option>
							<option <c:if test="${imoveis.estado == 'Cear?' }">selected</c:if> value="Cear?">Cear?</option>
							<option <c:if test="${imoveis.estado == 'Maranh?o' }">selected</c:if> value="Maranh?o">Maranh?o</option>
							<option <c:if test="${imoveis.estado == 'Para?ba' }">selected</c:if> value="Para?ba">Para?ba</option>
							<option <c:if test="${imoveis.estado == 'Pernambuco' }">selected</c:if> value="Pernambuco">Pernambuco</option>
							<option <c:if test="${imoveis.estado == 'Piau?' }">selected</c:if> value="Piau?">Piau?</option>
							<option <c:if test="${imoveis.estado == 'Rio Grande do Norte' }">selected</c:if> value="Rio Grande do Norte">Rio Grande do Norte</option>
							<option <c:if test="${imoveis.estado == 'Sergipe' }">selected</c:if> value="Sergipe">Sergipe</option>
						</optgroup>
						<optgroup label="Sudeste">
							<option <c:if test="${imoveis.estado == 'Acre' }">selected</c:if> value="Acre">Acre</option>
							<option <c:if test="${imoveis.estado == 'Amap?' }">selected</c:if> value="Amap?">Amap?</option>
							<option <c:if test="${imoveis.estado == 'Amazonas' }">selected</c:if> value="Amazonas">Amazonas</option>
							<option <c:if test="${imoveis.estado == 'Par?' }">selected</c:if> value="Par?">Par?</option>
							<option <c:if test="${imoveis.estado == 'Rond?nia' }">selected</c:if> value="Rond?nia">Rond?nia</option>
							<option <c:if test="${imoveis.estado == 'Roraima' }">selected</c:if> value="Roraima">Roraima</option>
							<option <c:if test="${imoveis.estado == 'Tocantins' }">selected</c:if> value="Tocantins">Tocantins</option>
						</optgroup>
						<optgroup label="Sudeste">
							<option <c:if test="${imoveis.estado == 'Esp?rito Santo' }">selected</c:if> value="Esp?rito Santo">Esp?rito Santo</option>
							<option <c:if test="${imoveis.estado == 'Minas Gerais' }">selected</c:if> value="Minas Gerais">Minas Gerais</option>
							<option <c:if test="${imoveis.estado == 'Rio de Janeiro' }">selected</c:if> value="Rio de Janeiro">Rio de Janeiro</option>
							<option <c:if test="${imoveis.estado == 'S?o Paulo' }">selected</c:if> value="S?o Paulo">S?o Paulo</option>
						</optgroup>
						<optgroup label="Sul">
							<option <c:if test="${imoveis.estado == 'Paran?' }">selected</c:if> value="Paran?">Paran?</option>
							<option <c:if test="${imoveis.estado == 'Rio Grande do Sul' }">selected</c:if> value="Rio Grande do Sul">Rio Grande do Sul</option>
							<option <c:if test="${imoveis.estado == 'Santa Catarina' }">selected</c:if> value="Santa Catarina">Santa Catarina</option>
						</optgroup>
					</select>
					</div>
					
					<div class="span3"><label>Condom?nio:</label><input value="${imoveis.condominio }" name="condominio" id="condominio" type="number" min="0" step="0.01" placeholder="Valor do Condom?nio" /></div> 
					
					<div class="span3"><label>Dispon?vel:</label>
					<select name="disponivel" id="disponivel" >
							<option <c:if test="${imoveis.disponivel == '0' }">selected</c:if> value="0">Sim</option>
							<option <c:if test="${imoveis.disponivel == '1' }">selected</c:if> value="1">N?o</option>
						</select>
					</div> 
					
					<div class="span3"><label>URL Google Maps:</label><input value="${imoveis.enderecoGoogleMap }" name="enderecoGoogleMap" id="enderecoGoogleMap" type="text" placeholder="Endere?o Google Maps" /></div> 
					
					<div class="span3"><label>Pre?o:</label><input name="preco" value="${imoveis.preco }" id="preco" type="number" min="0" step="0.01" placeholder="Pre?o" required/></div> 
					
					<div class="span3"><label>Quartos:</label>
					<select name="quartos" id="quartos" >
							<option <c:if test="${imoveis.quartos == 0 }">selected</c:if> value="0"> 0</option>
							<option <c:if test="${imoveis.quartos == 1 }">selected</c:if> value="1">1</option>
							<option <c:if test="${imoveis.quartos == 2 }">selected</c:if> value="2">2</option>
							<option <c:if test="${imoveis.quartos == 3 }">selected</c:if> value="3">3</option>
							<option <c:if test="${imoveis.quartos == 4 }">selected</c:if> value="4">4</option>
							<option <c:if test="${imoveis.quartos == 5 }">selected</c:if> value="5">5</option>
						</select>
					</div> 
 
					<div class="span3"><label>Rua:</label><input value="${imoveis.rua }" name="rua" id="rua" type="text" placeholder="Rua" /></div> 
					<div class="span3"><label>Salas:</label>
					<select name="salas" id="salas" >
							<option <c:if test="${imoveis.salas == 0 }">selected</c:if> value="0">0</option>
							<option <c:if test="${imoveis.salas == 1 }">selected</c:if> value="1">1</option>
							<option <c:if test="${imoveis.salas == 2 }">selected</c:if> value="2">2</option>
							<option <c:if test="${imoveis.salas == 3 }">selected</c:if> value="3">3</option>
							<option <c:if test="${imoveis.salas == 4 }">selected</c:if> value="4">4</option>
							<option <c:if test="${imoveis.salas == 5 }">selected</c:if> value="5">5</option>
						</select>
					</div> 
										
					<div class="span3"><label>Tamanho m<sup>2</sup>:</label><input value="${imoveis.tamanho }" name="tamanho" id="tamanho" type="number" placeholder="Tamanho do Im?vel" /></div> 
					
					<div class="span3"><label>Vagas:</label>
						<select name="vagas" id="vagas" >
							<option <c:if test="${imoveis.vagas == 0 }">selected</c:if> value="0">0</option>
							<option <c:if test="${imoveis.vagas == 1 }">selected</c:if> value="1">1</option>
							<option <c:if test="${imoveis.vagas == 2 }">selected</c:if> value="2">2</option>
							<option <c:if test="${imoveis.vagas == 3 }">selected</c:if> value="3">3</option>
							<option <c:if test="${imoveis.vagas == 4 }">selected</c:if> value="4">4</option>
							<option <c:if test="${imoveis.vagas == 5 }">selected</c:if> value="5">5</option>
						</select>
					</div>
					
					<div class="span3"><label>Imagem 1:</label><input value="${imoveis.imagem1 }" name="imagem1" id="imagem1" type="text" placeholder="URL Imagem 1" /></div> 
					<div class="span3"><label>Imagem 2:</label><input value="${imoveis.imagem2 }" name="imagem2" id="imagem2" type="text" placeholder="URL Imagem 2" /></div> 
					<div class="span3"><label>Imagem 3:</label><input value="${imoveis.imagem3 }" name="imagem3" id="imagem3" type="text" placeholder="URL Imagem 3" /></div> 
					<div class="span3"><label>Imagem 4:</label><input value="${imoveis.imagem4 }" name="imagem4" id="imagem4" type="text" placeholder="URL Imagem 4" /></div>
					<div class="span3"><label>Imagem 5:</label><input value="${imoveis.imagem5 }" name="imagem5" id="imagem5" type="text" placeholder="URL Imagem 5" /></div> 
					<div class="span3"><label>Imagem 6:</label><input value="${imoveis.imagem6 }" name="imagem6" id="imagem6" type="text" placeholder="URL Imagem 6" /></div> 
					<div class="span3"><label>Imagem 7:</label><input value="${imoveis.imagem7 }" name="imagem7" id="imagem7" type="text" placeholder="URL Imagem 7" /></div> 
					<div class="span3"><label>Imagem 8:</label><input value="${imoveis.imagem8 }" name="imagem8" id="imagem8" type="text" placeholder="URL Imagem 8" /></div>
					
					<div class="span12">&nbsp</div>
					
					<div class="span3"><label>Imobili?ria:</label>
					<select name="imobiliaria" id="imobiliaria" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${imobiliarias }" var="o">
							<option  <c:forEach items="${imoveis.imobiliaria }" var="p"> <c:if test="${p.nome ==  o.nome}"> selected </c:if> </c:forEach> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
 
					<div class="span3"><label>Tipo Pagamento:</label>
					<select name="tipoPagamento" id="tipoPagamento" multiple data-plugin-selectTwo class="populate span3">
							<c:forEach items="${tipoPagamento }" var="o">
							<option  <c:forEach items="${imoveis.tipoPagamento }" var="p"> <c:if test="${p.nome ==  o.nome}"> selected </c:if> </c:forEach> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Lazer:</label>
					<select name="lazer" id="lazer" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${lazer }" var="o">
							<option  <c:forEach items="${imoveis.lazer }" var="p"> <c:if test="${p.nome ==  o.nome}"> selected </c:if> </c:forEach> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Seguran?a:</label>
					<select multiple data-plugin-selectTwo class="populate span3" name="seguranca" id="seguranca" >
							<c:forEach items="${seguranca }" var="o">
							<option  <c:forEach items="${imoveis.seguranca }" var="p"> <c:if test="${p.nome ==  o.nome}"> selected </c:if> </c:forEach> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Comodidade:</label>
					<select name="comodidade" id="comodidade" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${comodidades }" var="o">
							<option  <c:forEach items="${imoveis.comodidade }" var="p"> <c:if test="${p.nome ==  o.nome}"> selected </c:if> </c:forEach> value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span12"><label>&nbsp</label>
					<a type="button" href="/cadastrar_imoveis" class="btn btn-danger waves-effect waves-light" >Voltar</a>
					<button type="button" onclick="submitImovel()" class="btn btn-default waves-effect waves-light" >Atualizar</button>
					</div>

				    <input type="hidden" name="idAtualiza" id="idAtualiza" value="${idPesq }">
				    <input type="hidden" name="acao" id="acao" value="leitura">
				    
				</div>
			</div>
		</div>
	</div>
	
</form>
















<form action="/cadastrar_imoveis" id="formImovel" method="post" accept-charset="utf-8">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Lista de Im?veis</h2><br>
			<div>
				<input type="text" placeholder="Pesquisar c?digo..." id="search" onkeyup="filtra()">
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<div class="row" style="max-height:500px; max-width:100%; overflow:auto; text-align:left">
				
				<table id="dados" class="table table-bordered table-striped mb-none" >
				<tr>
					<th>C?digo
					<th>Editar
					<th>Excluir
					<th>Respons?vel
					<th>Contato Respons?vel
					<th>Status
					<th>Tipo
					<th>Categoria
					<th>Descri??o 
					<th>Bairro
					<th>Banheiros
					<th>CEP
					<th>Cidade
					<th>Estado
					<th>Valor do Condom?nio
					<th>Dispon?vel
					<th>Endere?o Google Maps
					<th>Pre?o
					<th>Quartos
					<th>Rua
					<th>Salas
					<th>Tamanho
					<th>Vagas
					<th>Imagem 1
					<th>Imagem 2
					<th>Imagem 3
					<th>Imagem 4
					<th>Imagem 5
					<th>Imagem 6
					<th>Imagem 7
					<th>Imagem 8
					<th>Imobili?ria
					<th>Tipo Pagamento
					<th>Lazer
					<th>Seguran?a
					<th>Comodidades

				</tr>
					<tr>
						<td><a href="/imovel_${imoveis.id }">${imoveis.id }</a>
						<td><i class="fa fa-pencil" onclick="redirecionar(${imoveis.id})" style="color:blue; cursor:pointer"></i>
						<td><i class="fa fa-trash" onclick="modalDeletar('imovel', ${imoveis.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>						
						<td>${imoveis.responsavel }
						<td>${imoveis.contatoResponsavel }
						<td>${imoveis.statusImovel.nome }
						<td>${imoveis.tipoImovel.nome }
						<td>${imoveis.categoria.nome }
						<td>${imoveis.descricao }
						<td>${imoveis.bairro }
						<td>${imoveis.banheiros }
						<td>${imoveis.cep }
						<td>${imoveis.cidade }
						<td>${imoveis.estado }
						<td>${imoveis.condominio }
						<td><c:if test="${imoveis.disponivel }">Sim</c:if><c:if test="${!i.disponivel }">N?o</c:if>
						<td>${imoveis.enderecoGoogleMap }
						<td>${imoveis.preco }
						<td>${imoveis.quartos }
						<td>${imoveis.rua }
						<td>${imoveis.salas }
						<td>${imoveis.tamanho }
						<td>${imoveis.vagas }
						<td>${imoveis.imagem1 }
						<td>${imoveis.imagem2 }
						<td>${imoveis.imagem3 }
						<td>${imoveis.imagem4 }
						<td>${imoveis.imagem5 }
						<td>${imoveis.imagem6 }
						<td>${imoveis.imagem7 }
						<td>${imoveis.imagem8 }
						<td><c:forEach items="${imoveis.imobiliaria }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${imoveis.tipoPagamento }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${imoveis.lazer }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${imoveis.seguranca }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${imoveis.comodidade }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
					</tr>
				</table>
				
				</div>
			</div>
		</div>
	</div>
	
</form>











</c:if>







<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->