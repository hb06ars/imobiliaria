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
	  var x = document.forms["formEspecificacoes"]["nome"].value;
	  if (x == "") {
	    alert("Prrencha todos os campos!");
	    return false;
	  } else{
		document.getElementById("acao").value = "salvar";
		document.getElementById("formEspecificacoes").submit();
	  }
}


function filtra() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("search");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("dados");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[3];
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




<form action="/cadastrar_especificacoes" id="formEspecificacoes" method="post" accept-charset="utf-8" onsubmit="return validateForm()">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Cadastrar<br><br>Especificações</h2><br>
		</div>
		<div id="content">
			<div class="container">
				<div class="row">
					
					<div class="span2"><label>Tipo:</label>
						<select class="span2" name="tipo" id="tipo" >
							<option value="Comodidade">Comodidade</option>
							<option value="Lazer">Lazer</option>
							<option value="Segurança">Segurança</option>						</select>
					</div>
					
					<div class="span5"><label>Descrição:</label><input class="span5" name="descricao" id="descricao" type="text" placeholder="Descrição" /></div>
					<div class="span5"><label>Nome:</label><input class="span5" name="nome" id="nome" type="text" placeholder="Nome" /></div>
					
				    <div class="span12"><button type="submit" class="btn btn-default waves-effect waves-light" >Salvar</button></div>
				    <input type="hidden" name="acao" id="acao" value="leitura">
				    <input type="hidden" name="idAtualiza" id="idAtualiza" value="${idPesq }">
				    
				</div>
			</div>
		</div>
	</div>
	
</form>
















	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Lista de Especificações</h2><br>
			<div>
				<input type="text" placeholder="Pesquisar código..." id="search" onkeyup="filtra()">
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<div class="row" style="max-height:500px; max-width:100%; overflow:auto; text-align:left">
				
				<table id="dados" class="table table-bordered table-striped mb-none" >
				<tr>
					<th>Excluir
					<th>Ativo
					<th>Tipo
					<th>Descrição
					<th>Nome

				</tr>
				<c:forEach items="${seguranca }" var="i">
					<tr>
						<td><i class="fa fa-trash" onclick="modalDeletar('seguranca', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						<td><c:if test="${i.ativo }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.ativo }"><span style="color:red">Não</span></c:if>
						<td>Segurança
						<td>${i.descricao }
						<td>${i.nome }
					</tr>
				</c:forEach>
				<c:forEach items="${lazer }" var="i">
					<tr>
						<td><i class="fa fa-trash" onclick="modalDeletar('lazer', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						<td><c:if test="${i.ativo }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.ativo }"><span style="color:red">Não</span></c:if>
						<td>Lazer
						<td>${i.descricao }
						<td>${i.nome }
					</tr>
				</c:forEach>
				<c:forEach items="${comodidade }" var="i">
					<tr>
						<td><i class="fa fa-trash" onclick="modalDeletar('comodidade', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						<td><c:if test="${i.ativo }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.ativo }"><span style="color:red">Não</span></c:if>
						<td>Comodidade
						<td>${i.descricao }
						<td>${i.nome }
					</tr>
				</c:forEach>
				</table>
				
				</div>
			</div>
		</div>
	</div>
	


















<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->