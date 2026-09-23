<?php
include("CLASSES/conexao.php");
require_once 'CLASSES/usuarios.php';
    $u = new Usuario;
?>
<!DOCTYPE html>
<html lang="pt-br">
	<!--begin::Head-->
	<head><base href="dist/">
		<meta charset="utf-8"/>
		<title>KOPHEX</title>
		<meta name="description" content="KOPHEX" />
		<meta name="theme-color" content="#1E1E2D">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<link rel="manifest" href="../manifest.json"/>
	    <link rel="canonical" href="https://kophex.com.br/controle/"/>
	    <meta name="mobile-web-app-capable" content="yes">
	    <meta name="apple-mobile-web-app-capable" content=”yes”>
	    <meta name="apple-mobile-web-app-title" content="KOPHEX">
	    <link rel="apple-touch-icon" href="img/icon.png"/>
	    <link rel="apple-touch-icon" sizes="152x152" href="img/icon.png"/>
	    <link rel="apple-touch-icon" sizes="167x167" href="img/icon.png"/>
	    <link rel="apple-touch-icon" sizes="180x180" href="img/icon.png"/>
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Page Custom Styles(used by this page)-->
		<link href="assets/css/pages/login/classic/login-4.css" rel="stylesheet" type="text/css" />
		<!--end::Page Custom Styles-->
		<!--begin::Global Theme Styles(used by all pages)-->
		<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		<!--end::Global Theme Styles-->
		<!--begin::Layout Themes(used by all pages)-->
		<!--end::Layout Themes-->
		<link rel="shortcut icon" href="../img/fav.png"> 
		<meta itemprop="image" content="https://kophex.com.br/controle/img/icon.png">
	</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled sidebar-enabled page-loading">
	    <script>
          if ('serviceWorker' in navigator) {
                          navigator.serviceWorker.register('../sw.js')
                          .then(function () {
                            console.log('Service worker registered');
                          })
                          .catch(function () {
                            console.warn('service worker failed');
                          });
                        }
        </script>
		<!--begin::Main-->
		<div class="d-flex flex-column flex-root">
			<!--begin::Login-->
			<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
				<div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('../img/fundo.gif');">
					<div class="login-form text-center p-7 position-relative overflow-hidden">
						<!--begin::Login Header--> 
						<div class="d-flex flex-center mb-15">
								<img src="../img/logo.png" class="max-h-200px" alt="">
						</div>
						<!--end::Login Header-->
						<!--begin::Login Sign in form-->
						<div class="login-signin">
							<form method="POST" class="form">
								<div class="form-group mb-5">
									<input class="form-control h-auto form-control-solid py-4 px-8" type="text" placeholder="Login de acesso" name="login" autocomplete="off" />
								</div>
								<div class="form-group mb-5">
									<input class="form-control h-auto form-control-solid py-4 px-8" type="password" placeholder="Senha de acesso" name="senha" />	
								</div>
								<div class="form-group text-center mt-10">
									<button type="submit" class="btn btn-pill h3 btn-white text-dark opacity-90 px-15 py-3"><strong>ACESSAR</strong></button>
								</div>
							</form>
							<?php 
if(isset($_POST['login'])) 
{
    $login = addslashes($_POST['login']);
    $senha = addslashes($_POST['senha']);
      
    if(!empty($login) && !empty($senha))
    {   
        $u->conectar("banco","localhost","usuario","senha");
        //if($u->msgErro == "")

        {   
        if($u->logar($login,$senha))
        {
            header("location: dashboard.php");
        }
        else   
        {
            ?>
            <br>
           <div class="alert alert-custom alert-outline-white fade show mb-5" role="alert">
    <div class="alert-icon"><i class="flaticon-warning"></i></div>
    <div class="alert-text">Login e/ou senha estão incorretos! <br> Ou usuário não cadastrado!</div>
    <div class="alert-close">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true"><i class="ki ki-close"></i></span>
        </button>
    </div>
</div>
            <?php
        } 
    }
         
    }else
    {
        ?>
        <br>
           <div class="alert alert-custom alert-outline-warning fade show mb-5" role="alert">
    <div class="alert-icon"><i class="flaticon-warning"></i></div>
    <div class="alert-text">Preencha todos os Campos!</div>
    <div class="alert-close">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true"><i class="ki ki-close"></i></span>
        </button>
    </div>
</div>
            <?php
        }
    }   
?>
						</div>
						<!--end::Login Sign in form-->
						
					</div>
				</div>
			</div>
			<!--end::Login-->
		</div>
		<!--end::Main-->
		<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>
		<!--begin::Global Config(global config for global JS scripts)-->
		<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#663259", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#F4E1F0", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>
		<!--end::Global Config-->
		<!--begin::Global Theme Bundle(used by all pages)-->
		<script src="assets/plugins/global/plugins.bundle.js"></script>
		<script src="assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
		<script src="assets/js/scripts.bundle.js"></script>
		<!--end::Global Theme Bundle-->
		<!--begin::Page Scripts(used by this page)-->
		<script src="assets/js/pages/custom/login/login-general.js"></script>
		<!--end::Page Scripts-->
	</body>
	<!--end::Body-->
</html>