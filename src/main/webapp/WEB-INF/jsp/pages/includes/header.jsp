<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Imobiliária</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="shortcut icon" href="img/logoIcone.png">

    <!-- LOAD CSS FILES -->
    <link href="css/main.css" rel="stylesheet" type="text/css">
	
	<!-- Pode dar ERRO -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
	
	<!-- SELECT2 -->
	<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
	<script src="assets/vendor/modernizr/modernizr.js"></script>
	<!-- SELECT2 -->
	
	<!-- TABLES -->
	<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
	<!-- TABLES -->

    <!-- LOAD JS FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/easing.js"></script>
    <script src="js/jquery.lazyload.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/selectnav.js"></script>
    <script src="js/ender.js"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/custom.js"></script>
    
    
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
</head>

<body id="home">
        <!-- header begin -->
    <header>
        <div class="container">
            <div class="row">
                <div class="span3">
                    <div id="logo">
                        <div class="inner">
                            <a href="/">
                                <img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                </div>

                <div class="span9">
                    <!-- mainmenu begin -->
                    <div id="mainmenu-container">
                        <ul id="mainmenu">
                            <li><a href="/index">Home</a></li>
                            <li><a href="/contato">Contato</a></li>
                            <c:if test="${usuario != null}">
                            	<li><a href="#">Cadastrar</a>
	                                <ul>
	                                    <li><a href="/cadastrar_imoveis">Imóveis</a></li>
	                                    <li><a href="/cadastrar_usuarios">Usuários</a></li>
	                                    <li><a href="/cadastrar_imobiliarias">Imobiliárias</a></li>
	                                    <li><a href="/cadastrar_especificacoes">Detalhes dos Imóveis</a></li>
	                                </ul>
	                            </li>
							</c:if>
                            <c:if test="${usuario == null}">
                            	<li><a href="/login">Login</a></li>
                            </c:if>
                            <c:if test="${usuario != null}">
                            	<li><a href="/deslogar">Logoff</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header close -->
