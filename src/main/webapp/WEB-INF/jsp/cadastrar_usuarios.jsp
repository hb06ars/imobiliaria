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
	  var x = document.forms["formUsuarios"]["nome"].value;
	  if (x == "") {
	    alert("Prrencha todos os campos!");
	    return false;
	  } else{
		document.getElementById("acao").value = "salvar";
		document.getElementById("formUsuarios").submit();
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


<form action="/cadastrar_usuarios" id="formUsuarios" method="post" accept-charset="utf-8" onsubmit="return validateForm()">
	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Cadastrar<br><br>Usuário</h2><br>
		</div>
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="span2"><label>Ativo:</label>
						<select class="span2" name="ativo" id="ativo" >
							<option <c:if test="${u.ativo || u.ativo == null }">selected</c:if> value="1">Sim</option>
							<option <c:if test="${!u.ativo }">selected</c:if> value="0">Não</option>
						</select>
					</div>
					 
					<div class="span2"><label>Gravação:</label>
						<select class="span2" name="gravacao" id="gravacao" >
							<option <c:if test="${u.gravacao || u.gravacao == null}">selected</c:if> value="1">Sim</option>
							<option <c:if test="${!u.gravacao }">selected</c:if> value="0">Não</option>
						</select>
					</div>
 
					<div class="span2"><label>Login:</label><input value="${u.login }" class="span2" name="login" id="login" type="text" placeholder="Login" required/></div>
					<div class="span4"><label>Nome:</label><input value="${u.nome }" class="span4" name="nome" id="nome" type="text" placeholder="nome" required /></div>
					<div class="span2"><label>Senha:</label><input value="" class="span2" name="senha" id="senha" type="password" placeholder="*****" required /></div>
					
				    <div class="span12"><button type="submit" class="btn btn-default waves-effect waves-light" >Cadastrar</button></div>
				    <input type="hidden" name="acao" id="acao" value="leitura">
				    <input type="hidden" name="idAtualiza" id="idAtualiza" value="${idPesq }">
				    
				</div>
			</div>
		</div>
	</div>
	
</form>
















	<div class="wrapper-page">
		<div class="ex-page-content text-center">
	    	<br><h2>Lista de Usuários</h2><br>
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
					<th>Ativo
					<th>Gravação
					<th>Leitura
					<th>Login
					<th>Nome
					<th>Senha

				</tr>
				<c:forEach items="${usuarios }" var="i">
					<tr>
						<td><a href="/cadastrar_usuarios_${i.id }">${i.id }</a>
						<td><a class="fa fa-pencil" href="/cadastrar_usuarios_${i.id }" style="color:blue; cursor:pointer"></a>
						<td><i class="fa fa-trash" onclick="modalDeletar('usuario', ${i.id})" style="color:red; cursor:pointer" aria-hidden="true"></i>
						
						<td><c:if test="${i.ativo }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.ativo }"><span style="color:red">Não</span></c:if>
						<td><c:if test="${i.gravacao }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.gravacao }"><span style="color:red">Não</span></c:if>
						<td><c:if test="${i.leitura }"><span style="color:blue">Sim</span></c:if><c:if test="${!i.leitura }"><span style="color:red">Não</span></c:if>
						<td>${i.login }
						<td>${i.nome }
						<td>*****
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