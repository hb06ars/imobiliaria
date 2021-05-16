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

function validateForm() {
	  var x = document.forms["formImovel"]["responsavel"].value;
	  if (x == "") {
	    alert("Prrencha todos os campos!");
	    return false;
	  } else{
		document.getElementById("acao").value = "salvar";
		document.getElementById("formImovel").submit();
	  }
}


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


<form action="/cadastrar_imoveis" id="formImovel" method="post" accept-charset="utf-8" onsubmit="return validateForm()">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Cadastrar Imóvel</h2><br>
		</div>
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="span3"><label>Responsável pelo Imóvel:</label><input name="responsavel" id="responsavel" type="text" placeholder="Responsável" /></div> 
					<div class="span3"><label>Contato Responsável:</label><input name="contatoResponsavel" id="contatoResponsavel" type="text" maxlength="14" minlength="13" onkeydown="javascript: fMasc( this, mTel );" placeholder="Contato Responsável" /></div> 
					
					<div class="span3"><label>Status Imóvel:</label>
					<select name="statusImovel" id="statusImovel" >
						<c:forEach items="${statusImovel }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Tipo Imóvel:</label>
					<select name="tipoImovel" id="tipoImovel" >
						<c:forEach items="${tipoImovel }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Categoria:</label>
					<select name="categoria" id="categoria" >
						<c:forEach items="${categorias }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 					

					<div class="span3"><label>Descrição:</label><input name="descricao" id="descricao" type="text" placeholder="Descrição" /></div> 
					
					<div class="span3"><label>Bairro:</label><input name="bairro" id="bairro" type="text" placeholder="Bairro" required/></div>
					
					<div class="span3"><label>Banheiros:</label>
					<select name="banheiros" id="banheiros" >
							<option value="0">0</option>
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div> 
 
					<div class="span3"><label>CEP:</label><input name="cep" id="cep" type="text" maxlength="9" minlength="9" onkeydown="javascript: fMasc( this, mCEP );" placeholder="CEP" required/></div> 
					<div class="span3"><label>Cidade<span id="cidadeAtual"></span>:</label>
					<select class="span2" name="cidade" id="cidade" required data-plugin-selectTwo data-plugin-options='{ "placeholder": "Selecione um Estado", "allowClear": true }'>
						<c:forEach items="${cidades }" var="o">
							<option value="${o.cidade }" >${o.cidade }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Estado<span id="estadoAtual"></span>:</label>
					<select class="span2" name="estado" required id="estado" data-plugin-selectTwo data-plugin-options='{ "placeholder": "Selecione um Estado", "allowClear": true }'>
						<optgroup label="Centro-Oeste">
							<option value="Goiás">Goiás</option>
							<option value="Mato Grosso">Mato Grosso</option>
							<option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
						</optgroup>
						<optgroup label="Nordeste">
							<option value="Alagoas">Alagoas</option>
							<option value="Bahia">Bahia</option>
							<option value="Ceará">Ceará</option>
							<option value="Maranhão">Maranhão</option>
							<option value="Paraíba">Paraíba</option>
							<option value="Pernambuco">Pernambuco</option>
							<option value="Piauí">Piauí</option>
							<option value="Rio Grande do Norte">Rio Grande do Norte</option>
							<option value="Sergipe">Sergipe</option>
						</optgroup>
						<optgroup label="Sudeste">
							<option value="Acre">Acre</option>
							<option value="Amapá">Amapá</option>
							<option value="Amazonas">Amazonas</option>
							<option value="Pará">Pará</option>
							<option value="Rondônia">Rondônia</option>
							<option value="Roraima">Roraima</option>
							<option value="Tocantins">Tocantins</option>
						</optgroup>
						<optgroup label="Sudeste">
							<option value="Espírito Santo">Espírito Santo</option>
							<option value="Minas Gerais">Minas Gerais</option>
							<option value="Rio de Janeiro">Rio de Janeiro</option>
							<option selected value="São Paulo">São Paulo</option>
						</optgroup>
						<optgroup label="Sul">
							<option value="Paraná">Paraná</option>
							<option value="Rio Grande do Sul">Rio Grande do Sul</option>
							<option value="Santa Catarina">Santa Catarina</option>
						</optgroup>
					</select>
					</div>
					
					<div class="span3"><label>Condomínio:</label><input name="condominio" id="condominio" type="number" min="0" step="0.01" placeholder="Valor do Condomínio" /></div> 
					
					<div class="span3"><label>Disponível:</label>
					<select name="disponivel" id="disponivel" >
							<option value="0">Sim</option>
							<option value="1">Não</option>
						</select>
					</div> 
					
					<div class="span3"><label>URL Google Maps:</label><input name="enderecoGoogleMap" id="enderecoGoogleMap" type="text" placeholder="Endereço Google Maps" /></div> 
					
					<div class="span3"><label>Preço:</label><input name="preco" id="preco" type="number" min="0" step="0.01" placeholder="Preço" required/></div> 
					
					<div class="span3"><label>Quartos:</label>
					<select name="quartos" id="quartos" >
							<option value="0">0</option>
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div> 
 
					<div class="span3"><label>Rua:</label><input name="rua" id="rua" type="text" placeholder="Rua" /></div> 
					<div class="span3"><label>Salas:</label>
					<select name="salas" id="salas" >
							<option value="0">0</option>
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div> 
										
					<div class="span3"><label>Tamanho m<sup>2</sup>:</label><input name="tamanho" id="tamanho" type="number" placeholder="Tamanho do Imóvel" /></div> 
					
					<div class="span3"><label>Vagas:</label>
						<select name="vagas" id="vagas" >
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					
					<div class="span3"><label>Imagem 1:</label><input name="imagem1" id="imagem1" type="text" placeholder="URL Imagem 1" /></div> 
					<div class="span3"><label>Imagem 2:</label><input name="imagem2" id="imagem2" type="text" placeholder="URL Imagem 2" /></div> 
					<div class="span3"><label>Imagem 3:</label><input name="imagem3" id="imagem3" type="text" placeholder="URL Imagem 3" /></div> 
					<div class="span3"><label>Imagem 4:</label><input name="imagem4" id="imagem4" type="text" placeholder="URL Imagem 4" /></div>
					<div class="span3"><label>Imagem 5:</label><input name="imagem5" id="imagem5" type="text" placeholder="URL Imagem 5" /></div> 
					<div class="span3"><label>Imagem 6:</label><input name="imagem6" id="imagem6" type="text" placeholder="URL Imagem 6" /></div> 
					<div class="span3"><label>Imagem 7:</label><input name="imagem7" id="imagem7" type="text" placeholder="URL Imagem 7" /></div> 
					<div class="span3"><label>Imagem 8:</label><input name="imagem8" id="imagem8" type="text" placeholder="URL Imagem 8" /></div>
					
					<div class="span12">&nbsp</div>
					
					<div class="span3"><label>Imobiliária:</label>
					<select name="imobiliaria" id="imobiliaria" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${imobiliarias }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
						<span id="imobiliariaAtual"></span>
					</div>
 
					<div class="span3"><label>Tipo Pagamento:</label>
					<select name="tipoPagamento" id="tipoPagamento" multiple data-plugin-selectTwo class="populate span3">
							<c:forEach items="${tipoPagamento }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Lazer:</label>
					<select name="lazer" id="lazer" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${lazer }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					<div class="span3"><label>Segurança:</label>
					<select multiple data-plugin-selectTwo class="populate span3" name="seguranca" id="seguranca" >
							<c:forEach items="${seguranca }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div> 
					
					<div class="span3"><label>Comodidade:</label>
					<select name="comodidade" id="comodidade" multiple data-plugin-selectTwo class="populate span3">
						<c:forEach items="${comodidades }" var="o">
							<option value="${o.id }">${o.nome }</option>
						</c:forEach>
						</select>
					</div>
					
					
				    <div class="span12"><label>&nbsp</label><button type="submi" class="btn btn-default waves-effect waves-light" >Cadastrar</button></div>
				    <input type="hidden" name="acao" id="acao" value="leitura">
				    
				</div>
			</div>
		</div>
	</div>
	
</form>
















<form action="/cadastrar_imoveis" id="formImovel" method="post" accept-charset="utf-8">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Lista de Imóveis</h2><br>
			<div>
				<input type="text" placeholder="Pesquisar código..." id="search" onkeyup="filtra()">
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<div class="row" style="max-height:500px; max-width:100%; overflow:auto; text-align:left">
				
				<table id="dados" class="table table-bordered table-striped mb-none" >
				<tr>
					<th>Código
					<th>Editar
					<th>Excluir
					<th>Responsável
					<th>Contato Responsável
					<th>Status
					<th>Tipo
					<th>Categoria
					<th>Descrição 
					<th>Bairro
					<th>Banheiros
					<th>CEP
					<th>Cidade
					<th>Estado
					<th>Valor do Condomínio
					<th>Disponível
					<th>Endereço Google Maps
					<th>Preço
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
					<th>Imobiliária
					<th>Tipo Pagamento
					<th>Lazer
					<th>Segurança
					<th>Comodidades

				</tr>
				<c:forEach items="${imoveis }" var="i">
					<tr>
						<td><a href="/imovel_${i.id }">${i.id }</a>
						<td><a class="fa fa-pencil" href="/cadastrar_imoveis_${i.id }" style="color:blue; cursor:pointer"></a>
						<td><i class="fa fa-trash" onclick="modalDeletar('imovel', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						
						<td>${i.responsavel }
						<td>${i.contatoResponsavel }
						<td>${i.statusImovel.nome }
						<td>${i.tipoImovel.nome }
						<td>${i.categoria.nome }
						<td>${i.descricao }
						<td>${i.bairro }
						<td>${i.banheiros }
						<td>${i.cep }
						<td>${i.cidade }
						<td>${i.estado }
						<td>${i.condominio }
						<td><c:if test="${i.disponivel }">Sim</c:if><c:if test="${!i.disponivel }">Não</c:if>
						<td>${i.enderecoGoogleMap }
						<td>${i.preco }
						<td>${i.quartos }
						<td>${i.rua }
						<td>${i.salas }
						<td>${i.tamanho }
						<td>${i.vagas }
						<td>${i.imagem1 }
						<td>${i.imagem2 }
						<td>${i.imagem3 }
						<td>${i.imagem4 }
						<td>${i.imagem5 }
						<td>${i.imagem6 }
						<td>${i.imagem7 }
						<td>${i.imagem8 }
						<td><c:forEach items="${i.imobiliaria }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${i.tipoPagamento }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${i.lazer }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${i.seguranca }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
						<td><c:forEach items="${i.comodidade }" var="obj" varStatus="count"> <c:if test="${count.index > 0}">,</c:if> ${obj.nome }</c:forEach>
					</tr>
				</c:forEach>
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