<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
unset($_SESSION['id_usuario']);	
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");
require_once '../CLASSES/usuarios.php';
    $u = new Usuario;

//consulta no B.D.
$consulta = "SELECT * FROM usuarios WHERE id_usuario = '".$_SESSION['id_usuario']."'";
$login = $con->query($consulta) or die($con->error);

//consulta no B.D.
$consulta = "SELECT * FROM usuarios WHERE id_usuario = '".$_SESSION['id_usuario']."'";
$perfil = $con->query($consulta) or die($con->error);

$consulta = "SELECT * FROM usuarios ORDER BY id_usuario DESC";
$excluir = $con->query($consulta) or die($con->error);

$consulta = "SELECT * FROM usuarios ORDER BY id_usuario DESC";
$editar = $con->query($consulta) or die($con->error);

//consulta no B.D.
$consulta = "SELECT * FROM usuarios ORDER BY id_usuario DESC";
$lista = $con->query($consulta) or die($con->error);

//consulta no B.D.
$consulta = "SELECT * FROM usuarios WHERE id_usuario = '".$_SESSION['id_usuario']."' AND nivel_acesso = '1'";
$acesso_adm = $con->query($consulta) or die($con->error);

$status[0] = "DESABILITADO";
$status[1] = "HABILITADO";

$nivel[0] = "REPRESENTANTE";
$nivel[1] = "ADMINISTRADOR GERAL";

$statusc[0] = "danger";
$statusc[1] = "success";

$ativado[0] = "";
$ativado[1] = "checked";
$desativado[0] = "checked"; 
$desativado[1] = "";
?>

<!DOCTYPE html>
<html lang="pt-br">
	<!--begin::Head-->
	<head><base href="../dist/">
		<meta charset="utf-8" />
		<title>NOME EMPRESA</title>
		<meta name="description" content="NOME EMPRESA" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<link rel="canonical" href="https://keenthemes.com/metronic" />
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Page Vendors Styles(used by this page)-->
		<link href="assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
		<!--end::Page Vendors Styles-->
		<!--begin::Global Theme Styles(used by all pages)-->
		<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		<!--end::Global Theme Styles-->
		<!--begin::Layout Themes(used by all pages)-->
		<link href="assets/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/themes/layout/brand/dark.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/themes/layout/aside/dark.css" rel="stylesheet" type="text/css" />
		<!--end::Layout Themes-->
		<link rel="shortcut icon" href="../img/fav.png"> 
		<script src="assets/js/bluet.js"></script>
	</head>
	<!--end::Head-->

	<!--begin::Body-->
	<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize aside-minimize-hoverable page-loading">
		<!--begin::Main-->
		<!--begin::Header Mobile-->
		<div id="kt_header_mobile" class="header-mobile align-items-center header-mobile-fixed">
			<!--begin::Logo-->
			<a href="">
				<img alt="Logo" src="../img/logo.png" height="70" width="140" />
			</a>
			<!--end::Logo-->

			<!--begin::Toolbar-->
			<div class="d-flex align-items-center">
				<!--begin::Aside Mobile Toggle-->
				<button class="btn p-0 burger-icon burger-icon-left" id="kt_aside_mobile_toggle">
					<span></span>
				</button>
				<!--end::Topbar Mobile Toggle-->
			</div>
			<!--end::Toolbar-->
		</div>

		<!--end::Header Mobile-->
		<div class="d-flex flex-column flex-root">
			<!--begin::Page-->
			<div class="d-flex flex-row flex-column-fluid page">
				<!--begin::Aside-->
				<div class="aside aside-left aside-fixed d-flex flex-column flex-row-auto" id="kt_aside">
					<!--begin::Brand-->
					<div class="brand flex-column-auto" id="kt_brand">
						<!--begin::Logo-->
						<a class="brand-logo">
							<img alt="Logo" src="../img/logo.png" height="80" width="170" />
						</a>
						<!--end::Logo-->

						<!--begin::Toggle-->
						<button class="brand-toggle btn btn-sm px-0" id="kt_aside_toggle">
							<span class="svg-icon svg-icon svg-icon-white svg-icon-xl">
								<!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Angle-double-left.svg-->
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										<polygon points="0 0 24 0 24 24 0 24" />
										<path d="M5.29288961,6.70710318 C4.90236532,6.31657888 4.90236532,5.68341391 5.29288961,5.29288961 C5.68341391,4.90236532 6.31657888,4.90236532 6.70710318,5.29288961 L12.7071032,11.2928896 C13.0856821,11.6714686 13.0989277,12.281055 12.7371505,12.675721 L7.23715054,18.675721 C6.86395813,19.08284 6.23139076,19.1103429 5.82427177,18.7371505 C5.41715278,18.3639581 5.38964985,17.7313908 5.76284226,17.3242718 L10.6158586,12.0300721 L5.29288961,6.70710318 Z" fill="#000000" fill-rule="nonzero" transform="translate(8.999997, 11.999999) scale(-1, 1) translate(-8.999997, -11.999999)" />
										<path d="M10.7071009,15.7071068 C10.3165766,16.0976311 9.68341162,16.0976311 9.29288733,15.7071068 C8.90236304,15.3165825 8.90236304,14.6834175 9.29288733,14.2928932 L15.2928873,8.29289322 C15.6714663,7.91431428 16.2810527,7.90106866 16.6757187,8.26284586 L22.6757187,13.7628459 C23.0828377,14.1360383 23.1103407,14.7686056 22.7371482,15.1757246 C22.3639558,15.5828436 21.7313885,15.6103465 21.3242695,15.2371541 L16.0300699,10.3841378 L10.7071009,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(15.999997, 11.999999) scale(-1, 1) rotate(-270.000000) translate(-15.999997, -11.999999)" />
									</g>
								</svg>
								<!--end::Svg Icon-->
							</span>
						</button>
						<!--end::Toolbar-->
					</div>
					<!--end::Brand-->
					<!--begin::Aside Menu-->
					<div class="aside-menu-wrapper flex-column-fluid" id="kt_aside_menu_wrapper">
						<!--begin::Menu Container-->
						<div id="kt_aside_menu" class="aside-menu my-4" data-menu-vertical="1" data-menu-scroll="1" data-menu-dropdown-timeout="500">
							<!--begin::Menu Nav-->
							<ul class="menu-nav">

					<!--Dashboard-->
						<li class="menu-item menu-item-active" aria-haspopup="true">
							<a href="../dashboard.php" class="menu-link">
								<span class="svg-icon menu-icon">
									<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../src/media/svg/icons\Shopping\Chart-bar3.svg-->
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        										<rect x="0" y="0" width="24" height="24"/>
        										<rect fill="#000000" opacity="0.3" x="7" y="4" width="3" height="13" rx="1.5"/>
        										<rect fill="#000000" opacity="0.3" x="12" y="9" width="3" height="8" rx="1.5"/>
        										<path d="M5,19 L20,19 C20.5522847,19 21,19.4477153 21,20 C21,20.5522847 20.5522847,21 20,21 L4,21 C3.44771525,21 3,20.5522847 3,20 L3,4 C3,3.44771525 3.44771525,3 4,3 C4.55228475,3 5,3.44771525 5,4 L5,19 Z" fill="#000000" fill-rule="nonzero"/>
        										<rect fill="#000000" opacity="0.3" x="17" y="11" width="3" height="6" rx="1.5"/>
    										</g>
										</svg><!--end::Svg Icon--></span>
										<!--end::Svg Icon-->
									</span>
									<span class="menu-text">Dashboard</span>
									</a>
								</li>
								<!--Dashboard-->

								<!--Perfil-->
								<li class="menu-item" aria-haspopup="true">
									<a href="../perfil.php" class="menu-link">
										<span class="svg-icon menu-icon">
											<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../src/media/svg/icons\General\User.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        											<polygon points="0 0 24 0 24 24 0 24"/>
        											<path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        											<path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"/>
    											</g>
											</svg><!--end::Svg Icon--></span>
											<!--end::Svg Icon-->
										</span>
										<span class="menu-text text-white">Meu Perfil</span>
									</a>
								</li>
								<!--Perfil-->	
									

								
								<!--Menu Principal Desktop-->
								<li class="menu-section ">
									<h4 class="menu-text text-white">Menu Principal</h4>
									<i class="text-white menu-icon ki ki-bold-more-hor icon-md"></i>
								</li>
								<!--Menu Principal Desktop-->
								
							<!--Contas a receber-->
								<li class="menu-item " aria-haspopup="true">
									<a href="../contas.php" class="menu-link">
										<span class="svg-icon menu-icon">
											<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../srdia/svg/icons\General\Shield-protected.svg-->  	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect x="0" y="0" width="24" height="24"/>
        <rect fill="#000000" opacity="0.3" x="11.5" y="2" width="2" height="4" rx="1"/>
        <rect fill="#000000" opacity="0.3" x="11.5" y="16" width="2" height="5" rx="1"/>
        <path d="M15.493,8.044 C15.2143319,7.68933156 14.8501689,7.40750104 14.4005,7.1985 C13.9508311,6.98949895 13.5170021,6.885 13.099,6.885 C12.8836656,6.885 12.6651678,6.90399981 12.4435,6.942 C12.2218322,6.98000019 12.0223342,7.05283279 11.845,7.1605 C11.6676658,7.2681672 11.5188339,7.40749914 11.3985,7.5785 C11.2781661,7.74950085 11.218,7.96799867 11.218,8.234 C11.218,8.46200114 11.2654995,8.65199924 11.3605,8.804 C11.4555005,8.95600076 11.5948324,9.08899943 11.7785,9.203 C11.9621676,9.31700057 12.1806654,9.42149952 12.434,9.5165 C12.6873346,9.61150047 12.9723317,9.70966616 13.289,9.811 C13.7450023,9.96300076 14.2199975,10.1308324 14.714,10.3145 C15.2080025,10.4981676 15.6576646,10.7419985 16.063,11.046 C16.4683354,11.3500015 16.8039987,11.7268311 17.07,12.1765 C17.3360013,12.6261689 17.469,13.1866633 17.469,13.858 C17.469,14.6306705 17.3265014,15.2988305 17.0415,15.8625 C16.7564986,16.4261695 16.3733357,16.8916648 15.892,17.259 C15.4106643,17.6263352 14.8596698,17.8986658 14.239,18.076 C13.6183302,18.2533342 12.97867,18.342 12.32,18.342 C11.3573285,18.342 10.4263378,18.1741683 9.527,17.8385 C8.62766217,17.5028317 7.88033631,17.0246698 7.285,16.404 L9.413,14.238 C9.74233498,14.6433354 10.176164,14.9821653 10.7145,15.2545 C11.252836,15.5268347 11.7879973,15.663 12.32,15.663 C12.5606679,15.663 12.7949989,15.6376669 13.023,15.587 C13.2510011,15.5363331 13.4504991,15.4540006 13.6215,15.34 C13.7925009,15.2259994 13.9286662,15.0740009 14.03,14.884 C14.1313338,14.693999 14.182,14.4660013 14.182,14.2 C14.182,13.9466654 14.1186673,13.7313342 13.992,13.554 C13.8653327,13.3766658 13.6848345,13.2151674 13.4505,13.0695 C13.2161655,12.9238326 12.9248351,12.7908339 12.5765,12.6705 C12.2281649,12.5501661 11.8323355,12.420334 11.389,12.281 C10.9583312,12.141666 10.5371687,11.9770009 10.1255,11.787 C9.71383127,11.596999 9.34650161,11.3531682 9.0235,11.0555 C8.70049838,10.7578318 8.44083431,10.3968355 8.2445,9.9725 C8.04816568,9.54816454 7.95,9.03200304 7.95,8.424 C7.95,7.67666293 8.10199848,7.03700266 8.406,6.505 C8.71000152,5.97299734 9.10899753,5.53600171 9.603,5.194 C10.0970025,4.85199829 10.6543302,4.60183412 11.275,4.4435 C11.8956698,4.28516587 12.5226635,4.206 13.156,4.206 C13.9160038,4.206 14.6918294,4.34533194 15.4835,4.624 C16.2751706,4.90266806 16.9686637,5.31433061 17.564,5.859 L15.493,8.044 Z" fill="#000000"/>
    </g>
											</svg><!--end::Svg Icon--></span>
											<!--end::Svg Icon-->
										</span>
										<span class="menu-text text-white">Contas a receber</span>
									</a>
								</li>
								<!--Contas a receber-->

								<!--Liberacao-->
								<li class="menu-item " aria-haspopup="true">
									<a href="../liberacao.php" class="menu-link">
										<span class="svg-icon menu-icon">
											<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../srdia/svg/icons\General\Shield-protected.svg-->  	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        											<polygon points="0 0 24 0 24 24 0 24"/>
       												 <path d="M5.85714286,2 L13.7364114,2 C14.0910962,2 14.4343066,2.12568431 14.7051108,2.35473959 L19.4686994,6.3839416 C19.8056532,6.66894833 20,7.08787823 20,7.52920201 L20,20.0833333 C20,21.8738751 19.9795521,22 18.1428571,22 L5.85714286,22 C4.02044787,22 4,21.8738751 4,20.0833333 L4,3.91666667 C4,2.12612489 4.02044787,2 5.85714286,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        												<rect fill="#000000" x="6" y="11" width="9" height="2" rx="1"/>
        												<rect fill="#000000" x="6" y="15" width="5" height="2" rx="1"/>
    												</g>
											</svg><!--end::Svg Icon--></span>
											<!--end::Svg Icon-->
										</span>
										<span class="menu-text text-white">Liberação</span>
									</a>
								</li>
								<!--Liberacao-->
								
							<!--Cadastros-->
								<li class="menu-item menu-item-submenu " aria-haspopup="true" data-menu-toggle="hover">
									<a href="javascript:;" class="menu-link menu-toggle">
										<span class="svg-icon menu-icon">
										<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../src/media/svg/icons\Code\Plus.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    										 <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        										<rect x="0" y="0" width="24" height="24"/>
        										<circle fill="#000000" opacity="0.3" cx="12" cy="12" r="10"/>
        										<path d="M11,11 L11,7 C11,6.44771525 11.4477153,6 12,6 C12.5522847,6 13,6.44771525 13,7 L13,11 L17,11 C17.5522847,11 18,11.4477153 18,12 C18,12.5522847 17.5522847,13 17,13 L13,13 L13,17 C13,17.5522847 12.5522847,18 12,18 C11.4477153,18 11,17.5522847 11,17 L11,13 L7,13 C6.44771525,13 6,12.5522847 6,12 C6,11.4477153 6.44771525,11 7,11 L11,11 Z" fill="#000000"/>
    										</g>
										</svg><!--end::Svg Icon--></span>
										</span>
										<span class="menu-text text-white">Cadastros</span>
										<i class="menu-arrow"></i>
									</a>

							<div class="menu-submenu ">
								<i class="menu-arrow"></i>
									<ul class="menu-subnav">
										<li class="menu-item" aria-haspopup="true">
											<a href="../lista_cadastros/clientes.php" class="menu-link">
												<i class="menu-bullet menu-bullet-dot">
												<span></span></i>
												<span class="menu-text text-white">Clientes</span>
											</a>
										</li>

										<?php while ($dado = $acesso_adm ->fetch_array()){ ?>
										<li class="menu-item text-white" aria-haspopup="true">
											<a href="../lista_cadastros/sistemas.php" class="menu-link">
												<i class="menu-bullet menu-bullet-dot">
												<span></span></i>
												<span class="menu-text text-white">Sistemas</span>
											</a>
										</li>
											
										<li class="menu-item" aria-haspopup="true">
											<a href="../lista_cadastros/representantes.php" class="menu-link">
												<i class="menu-bullet menu-bullet-dot">
												<span></span></i>
												<span class="menu-text text-white">Representantes</span>
											</a>
										</li>

										<li class="menu-item" aria-haspopup="true">
											<a href="../lista_cadastros/usuarios.php" class="menu-link">
												<i class="menu-bullet menu-bullet-dot">
												<span></span></i>
												<span class="menu-text text-white">Usuários</span>
											</a>
										</li>
										<?php } ?>

										</ul>
									</div>
								</li>
								<!--Cadastros-->

								<!--Sair-->
								<li class="menu-item" aria-haspopup="true">
									<a href="../sair.php" class="menu-link">
										<span class="svg-icon menu-icon">
											<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo10\dist/../src/media/svg/icons\Electric\Shutdown.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
     											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        											<g transform="translate(12.000000, 12.000000) rotate(-45.000000) translate(-12.000000, -12.000000) translate(4.000000, 4.000000)" fill="#000000">
            											<rect x="0" y="7" width="16" height="2" rx="1"/>
            											<rect opacity="0.3" transform="translate(8.000000, 8.000000) rotate(-270.000000) translate(-8.000000, -8.000000) " x="0" y="7" width="16" height="2" rx="1"/>
        											</g>
    											</g>
											</svg><!--end::Svg Icon--></span>
											<!--end::Svg Icon-->
										</span>
										<span class="menu-text text-white">Sair</span>
									</a>
								</li>
								<!--Sair-->
							<!--end::Menu Nav-->
						</div>
						<!--end::Menu Container-->
					</div>
					<!--end::Aside Menu-->
				</div>
				<!--end::Aside-->

				<!--begin::Wrapper-->
				<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
					<!--begin::Header-->
					<div id="kt_header" class="header header-fixed">
						<!--begin::Container-->
						<div class="container-fluid d-flex align-items-stretch justify-content-between">
							<!--begin::Header Menu Wrapper-->
							<div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
							</div>
							<!--end::Header Menu Wrapper-->
							<!--begin::Topbar-->
							<div class="topbar">
								<!--begin::Search-->
								<div class="dropdown" id="kt_quick_search_toggle">
									<!--begin::Dropdown-->
									<div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-lg">
										<div class="quick-search quick-search-dropdown" id="kt_quick_search_dropdown">
											<!--begin:Form-->
											<form method="get" class="quick-search-form">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
															<span class="svg-icon svg-icon-lg">
																<!--begin::Svg Icon | path:assets/media/svg/icons/General/Search.svg-->
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24" />
																		<path d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" />
																		<path d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z" fill="#000000" fill-rule="nonzero" />
																	</g>
																</svg>
																<!--end::Svg Icon-->
															</span>
														</span>
													</div>

													<input type="text" class="form-control" placeholder="Search..." />
													<div class="input-group-append">
														<span class="input-group-text">
															<i class="quick-search-close ki ki-close icon-sm text-muted"></i>
														</span>
													</div>
												</div>
											</form>
											<!--end::Form-->
											<!--begin::Scroll-->
											<div class="quick-search-wrapper scroll" data-scroll="true" data-height="325" data-mobile-height="200"></div>
											<!--end::Scroll-->
										</div>
									</div>
									<!--end::Dropdown-->
								</div>
								<!--end::Search-->
								<!--end::Languages-->
								<!--begin::User-->

							<?php while ($dado = $login ->fetch_array()){ ?>	
								<div class="topbar-item">
									<div class="btn btn-icon btn-icon-mobile w-auto btn-white d-flex align-items-center btn-lg px-2" id="kt_quick_user_toggle">
										<span class="symbol symbol-lg-35 symbol-65 symbol-light-primary d-md-inline mr-3">
										<span class="symbol-label font-size-h5 font-weight-bold">Olá,</span>
										</span>
										<span class="text-dark-50 font-weight-bolder font-size-base d-none d-md-inline mr-3"><?php echo $dado['nome_usuario'] ?></span>
									</div>
								</div>
							<?php } ?>	
								<!--end::User-->
							</div>
							<!--end::Topbar-->
						</div>
						<!--end::Container-->
					</div>
					<!--end::Header-->
					<!--begin::Content-->

					<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

						

						<!--begin::Entry-->

						<div class="d-flex flex-column-fluid">

							<!--begin::Container-->



							<div class="container-fluid">

								<!--begin::Dashboard--><br>

								<!--Begin::Row-->

								<div class="row">
									<div class="col-xl-12">	
										<!--begin::Advance Table Widget 5-->
								<div class="card card-custom gutter-b">
									<!--begin::Header--><br>
									<center><h1 class="display-4 text-primary"><strong>GERENCIAMENTO DE USUÁRIOS</strong></h1></center>
									<div class="card-header border-0 py-5">
										<h3 class="card-title align-items-start flex-column">
											
										</h3>
										<div class="card-toolbar">
											<a data-toggle="modal" data-target="#ModalCadastro" class="btn btn-lg btn-primary font-weight-bolder font-size-lg mr-3"><i class="fas fa-plus-circle icon-2x"></i>CADASTRAR USUÁRIO</a>
										</div>
									</div>
									<!--end::Header-->
									<!--begin::Body-->
									<div class="card-body py-0">
										<!--begin::Table-->
										<div class="table-responsive">
											<table class="table table-head-custom table-vertical-center" id="tabela">
												<thead>
													<tr class="text-uppercase">
														<th style="min-width: 50px">NOME DO USUÁRIO</th>
														<th style="min-width: 140px">EMAIL</th>
														<th style="min-width: 140px">NIVEL DE ACESSO</th>
														<th style="min-width: 150px">STATUS:</th>
														<th class="pr-0 text-right" style="min-width: 60px">AÇÕES</th>
													</tr>
												</thead>
												<tbody>
												    <tr>
											    <th>
											    <input type="text" class="form-control form-control-lg" placeholder="Procurar...">
											    </th>
											    <th>
											    <input type="text" class="form-control form-control-lg" placeholder="Procurar...">
											    </th>
											   </tr> 
												<?php while ($dado = $lista ->fetch_array()){ ?>
													<tr>
														<td>
															<span class="text-dark-75 font-weight-bolder d-block font-size-lg"><?php echo $dado['nome_usuario'] ?></span>
														</td>
														<td>
														    <span class="text-dark-75 font-weight-bolder d-block font-size-lg"><?php echo $dado['email_usuario'] ?></span>
														</td>
														<td>
														    <span class="text-dark-75 font-weight-bolder d-block font-size-lg"><?php echo $nivel[$dado['nivel_acesso']] ?></span>
														</td>
														<td>
															<span class="text-<?php echo $statusc[$dado['status_usuario']] ?> font-weight-bolder d-block font-size-lg"><?php echo $status[$dado['status_usuario']] ?></span>
														</td>
														<td class="text-right pr-0">
															<a data-toggle="modal" data-target="#Modaleditar<?php echo $dado['id_usuario'] ?>" class="btn btn-icon btn-light btn-hover-primary btn-lg mr-3">
																<span class="svg-icon svg-icon-md svg-icon-primary">
																	<!--begin::Svg Icon | path:assets/media/svg/icons/General/Bookmark.svg-->
																	<i class="fas fa-edit icon-2x"></i>
																	<!--end::Svg Icon-->
																</span>
															</a>
															<a data-toggle="modal" data-target="#Modalexcluir<?php echo $dado['id_usuario'] ?>" class="btn btn-icon btn-light btn-hover-danger btn-lg mr-3">
																<span class="svg-icon svg-icon-md svg-icon-primary">
																	<!--begin::Svg Icon | path:assets/media/svg/icons/General/Bookmark.svg-->
																	<i class="fas fa-trash-alt icon-2x"></i>
																	<!--end::Svg Icon-->
																</span>
															</a>
														</td>
													</tr>
												<?php } ?>	

												</tbody>
											</table>
										</div>
										<!--end::Table-->
									</div>
									<!--end::Body-->
								</div>
								<!--end::Advance Table Widget 4-->
									<?php
										if(isset($_SESSION['msg']))
										{
											echo $_SESSION['msg'];
											unset($_SESSION['msg']);
										}
									?>		
								</div>							
							</div>
							<!--end::Container-->
						</div>
						<!--end::Entry-->

				<!--end::Wrapper-->

			</div>

			<!--end::Page-->

		</div>
		<!--end::Main-->

		<!-- Modal Cadastro-->
<div class="modal fade" id="ModalCadastro" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title text-primary" id="exampleModalLabel">Cadastrar Usuário</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
               <!--begin::Wizard Step 1-->
		<!--begin::Group-->
		<form method="POST" action="../cadastros/cadastrar_usuarios.php">

		<!--begin::Group-->
			<div class="form-group row">
				<label class="col-xl-3 col-lg-3 col-form-label">Nome do usuário<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg form-control-lg" name="nome" placeholder="Digite o nome do usuário..." required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->

		<!--begin::Group-->
			<div class="form-group row">
				<label for="sistema" class="col-xl-3 col-lg-3 col-form-label">E-mail de acesso<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg" name="email" placeholder="Digite o e-mail de acesso..." type="email" required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->

    	<!--begin::Group-->
			<div class="form-group row">
				<label for="sistema" class="col-xl-3 col-lg-3 col-form-label">Senha de acesso<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg" name="senha" placeholder="Digite a senha de acesso..." type="password" required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->
														
			<!--end::Wizard Step 1-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-lg btn-light-secondary text-dark font-weight-bold" data-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-lg btn-primary font-weight-bold">Cadastrar Usuário</button>
            </div>
            </form>
        </div>
    </div>
</div>

<?php while ($dado = $excluir ->fetch_array()){ ?>
		<!--begin::Modal Excluir-->
		<div class="modal fade" id="Modalexcluir<?php echo $dado['id_usuario'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<form method="POST" action="../deletar/excluir_usuario.php">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Excluir Sistema</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
            <center>
               <h3 class="display-5 text-danger"><strong>Deseja realmente excluir <br>o usuario: <?php echo $dado['nome_usuario'] ?>?</strong></h3>
               <br>
               <input type="hidden" name="id" value="<?php echo $dado['id_usuario'] ?>">
               	<button type="submit" class="btn btn-danger h3 font-weight-bold mr-1">Excluir</button>
               	<button type="button" class="btn btn-light-secondary text-dark h3 font-weight-bold" data-dismiss="modal">Voltar</button>
               	</form>
            </center>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<!-- end::Modal Excluir-->

<?php while ($dado = $editar ->fetch_array()){ ?>
		<!--begin::Modal Editar-->
		<div class="modal fade" id="Modaleditar<?php echo $dado['id_usuario'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Sistema</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
               <!--begin::Wizard Step 1-->
		<!--begin::Group-->
		<form method="POST" action="../editar/editar_usuario.php">

		<input type="hidden" name="id" value="<?php echo $dado['id_usuario'] ?>">	
		<!--begin::Group-->
			<div class="form-group row">
				<label class="col-xl-3 col-lg-3 col-form-label">Nome do usuário<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg form-control-lg" name="nome" placeholder="Digite o nome do usuário..." value="<?php echo $dado['nome_usuario'] ?>" required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->

		<!--begin::Group-->
			<div class="form-group row">
				<label for="sistema" class="col-xl-3 col-lg-3 col-form-label">E-mail de acesso<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg" name="email" placeholder="Digite o e-mail de acesso..." type="email" value="<?php echo $dado['email_usuario'] ?>" required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->

    	<!--begin::Group-->
			<div class="form-group row">
				<label for="sistema" class="col-xl-3 col-lg-3 col-form-label">Senha de acesso<strong class="text-danger">*</strong></label>
					<div class="col-lg-9 col-xl-9">
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<input class="form-control form-control-lg" name="senha" placeholder="Digite a senha de acesso..." type="password" value="<?php echo $dado['senha_usuario'] ?>" required>
							</div>
						</div>
					</div>
			    </div>
    	<!--end::Group-->

    	<!--begin::Group-->
		<div class="form-group row">
			<label class="col-xl-3 col-lg-3 col-form-label">Status de Ativação <strong class="text-danger">*</strong></label>
				<div class="col-lg-9 col-xl-9">
					<div class="row">
						<div class="col-lg-6 col-sm-2">
							<label class="option">
								<span class="option-control">
									<span class="radio radio-success radio-bold radio-brand">
										<input type="radio" name="status" value="1" <?php echo $ativado[$dado['status_usuario']] ?>>
										<span></span>
									</span>
								</span>
								<span class="option-label">
									<span class="option-head">
										<span class="h4 option-focus text-success">Habilitado</span>
										</span>
									</span>
							</label>
						</div>

					<div class="col-lg-6 col-sm-2">
							<label class="option">
								<span class="option-control">
									<span class="radio radio-danger radio-bold radio-brand">
										<input type="radio" name="status" value="0" <?php echo $desativado[$dado['status_usuario']] ?>>
										<span></span>
									</span>
								</span>
								<span class="option-label">
									<span class="option-head">
										<span class="h4 option-focus text-danger">Desabilitado</span>
										</span>
									</span>
							</label>
						</div>
					</div>
  		 		</div>
			</div>
		<!--end::Group-->
        
        <!--end::Wizard Step 1-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-lg btn-light-secondary text-dark font-weight-bold" data-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-lg btn-primary font-weight-bold">Editar Usuário</button>
            </div>
            </form>
        </div>
    </div>
</div>
<?php } ?>
<!-- end::Modal Editar-->

		<?php while ($dado = $perfil ->fetch_array()){ ?>

		<!-- begin::User Panel-->

		<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">

			<!--begin::Header-->

			<div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">

				<h3 class="font-weight-bold m-0">Perfil do Usuário</h3>

				<a class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_user_close">

					<i class="ki ki-close icon-xs text-muted"></i>

				</a>

			</div>

			<!--end::Header-->

			<!--begin::Content-->

			<div class="offcanvas-content pr-5 mr-n5">

				<!--begin::Header-->

				<div class="d-flex align-items-center mt-5">

					<div class="symbol symbol-100 mr-5">

						<div class="symbol-label" style="background-image:url('assets/media/users/blank.png')"></div>

						<i class="symbol-badge bg-success"></i>

					</div>

					<div class="d-flex flex-column">

						<a class="font-weight-bold font-size-h5 text-primary">

						<?php echo $dado['nome_usuario'] ?></a>

						<div class="navi mt-2">

							<a class="navi-item">

								<span class="navi-link p-0 pb-2">

									<span class="navi-icon mr-1">

										<span class="svg-icon svg-icon-lg svg-icon-primary">

											<!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-notification.svg-->

											<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">

												<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">

													<rect x="0" y="0" width="24" height="24" />

													<path d="M21,12.0829584 C20.6747915,12.0283988 20.3407122,12 20,12 C16.6862915,12 14,14.6862915 14,18 C14,18.3407122 14.0283988,18.6747915 14.0829584,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,8 C3,6.8954305 3.8954305,6 5,6 L19,6 C20.1045695,6 21,6.8954305 21,8 L21,12.0829584 Z M18.1444251,7.83964668 L12,11.1481833 L5.85557487,7.83964668 C5.4908718,7.6432681 5.03602525,7.77972206 4.83964668,8.14442513 C4.6432681,8.5091282 4.77972206,8.96397475 5.14442513,9.16035332 L11.6444251,12.6603533 C11.8664074,12.7798822 12.1335926,12.7798822 12.3555749,12.6603533 L18.8555749,9.16035332 C19.2202779,8.96397475 19.3567319,8.5091282 19.1603533,8.14442513 C18.9639747,7.77972206 18.5091282,7.6432681 18.1444251,7.83964668 Z" fill="#000000" />

													<circle fill="#000000" opacity="0.3" cx="19.5" cy="17.5" r="2.5" />

												</g>

											</svg>

											<!--end::Svg Icon-->

										</span>

									</span>

									<span class="navi-text text-muted text-hover-primary"><?php echo $dado['email_usuario'] ?></span>

								</span>

							</a>

							<a href="../perfil.php" class="btn btn-sm btn-light-primary font-weight-bolder py-2 px-5">Ver Perfil</a>

						</div>

					</div>

				</div>

				<!--end::Header-->

				<?php } ?>

				


				<!--begin::Nav-->

				<div class="navi navi-spacer-x-0 p-0">

				</div>

				<!--end::Nav-->

				<!--begin::Separator-->

				<div class="separator separator-dashed my-7"></div>

				<!--end::Separator-->

			</div>

			<!--end::Content-->

		</div>

		<!-- end::User Panel-->

		<!--begin::Scrolltop-->

		<div id="kt_scrolltop" class="scrolltop">

			<span class="svg-icon">

				<!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg-->

				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">

					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">

						<polygon points="0 0 24 0 24 24 0 24" />

						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1" />

						<path d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z" fill="#000000" fill-rule="nonzero" />

					</g>

				</svg>

				<!--end::Svg Icon-->

			</span>

		</div>

		<!--end::Scrolltop-->

		<!--begin::Demo Panel-->

		<!--end::Demo Panel-->

		<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>

		<!--begin::Global Config(global config for global JS scripts)-->

		<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1400 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#3699FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#E4E6EF", "dark": "#181C32" }, "light": { "white": "#ffffff", "primary": "#E1F0FF", "secondary": "#EBEDF3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#3F4254", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#EBEDF3", "gray-300": "#E4E6EF", "gray-400": "#D1D3E0", "gray-500": "#B5B5C3", "gray-600": "#7E8299", "gray-700": "#5E6278", "gray-800": "#3F4254", "gray-900": "#181C32" } }, "font-family": "Poppins" };</script>

		<!--end::Global Config-->

		<!--begin::Global Theme Bundle(used by all pages)-->
		<script src="assets/plugins/global/plugins.bundle.js"></script>
		<script src="assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
		<script src="assets/js/scripts.bundle.js"></script>
		<!--end::Global Theme Bundle-->

		<!--begin::Page Vendors(used by this page)-->
		<script src="assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
		<!--end::Page Vendors-->

		<!--begin::Page Scripts(used by this page)-->
		<script src="assets/js/pages/widgets.js"></script>
		<!--begin::Page Scripts(used by this page)-->
		<script src="assets/js/pages/custom/user/list-datatable.js"></script>
		<!--end::Page Scripts-->

		 <script>
		    $(function(){
	$("#tabela input").keyup(function(){		

		var index = $(this).parent().index();
		var nth = "#tabela td:nth-child("+(index+1).toString()+")";
		var valor = $(this).val().toUpperCase();
		$("#tabela tbody tr").show();
		$(nth).each(function(){
			if($(this).text().toUpperCase().indexOf(valor) < 0){
				$(this).parent().hide();
			}
		});
	});

	$("#tabela input").blur(function(){
		$(this).val("");
	});	
});
		</script>
	</body>

	<!--end::Body-->

</html>