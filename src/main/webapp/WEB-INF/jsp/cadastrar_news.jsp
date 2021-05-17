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
	  var x = document.forms["formNews"]["descricao"].value;
	  if (x == "") {
	    alert("Prrencha todos os campos!");
	    return false;
	  } else{
		document.getElementById("acao").value = "salvar";
		document.getElementById("formNews").submit();
	  }
}


function filtra() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("search");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("dados");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
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


<form action="/cadastrar_news" id="formNews" method="post" accept-charset="utf-8" onsubmit="return validateForm()">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Cadastrar<br><br>Notícias</h2><br>
		</div>
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="span12"><label>Recado:</label><input value="${n.descricao }" class="span12" name="descricao" id="descricao" type="text" placeholder="Insira um recado." required/></div>
					
					<div class="span12"><button type="submit" class="btn btn-default waves-effect waves-light" >Cadastrar</button></div>
				    <input type="hidden" name="acao" id="acao" value="leitura">
				    
				</div>
			</div>
		</div>
	</div>
	
</form>
















	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Lista de Notícias</h2><br>
			<div>
				<input type="text" placeholder="Pesquisar código..." id="search" onkeyup="filtra()">
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<div class="row" style="max-height:500px; max-width:100%; overflow:auto; text-align:left">
				
				<table id="dados" class="table table-bordered table-striped mb-none" >
				<tr>
					<th style="max-width:5px">Excluir
					<th>Recado

				</tr>
				<c:forEach items="${news }" var="i">
					<tr>
						<td style="max-width:5px" ><i class="fa fa-trash" onclick="modalDeletar('news', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						<td>${i.descricao }
					</tr>
				</c:forEach>
				</table>
				
				</div>
			</div>
		</div>
	</div>
	











</c:if>







<!-- FOOTER -->
<jsp:include page="pages/includes/footer.jsp" />
<!-- FOOTER -->