-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Abr-2022 às 13:19
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `liberacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `arquivo_representantes`
--

CREATE TABLE `arquivo_representantes` (
  `id_arquivo` int(11) NOT NULL,
  `nome_arquivo` varchar(200) NOT NULL,
  `caminho_arquivo` varchar(200) NOT NULL,
  `id_representante_fk` int(11) NOT NULL,
  `nome_representante_fk` varchar(200) NOT NULL,
  `cnpj_revenda` varchar(100) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `arquivo_representantes`
--

--
-- Estrutura da tabela `bloqueio_vencimento`
--

CREATE TABLE `bloqueio_vencimento` (
  `id_bloqueio` int(11) NOT NULL,
  `valor_bloqueio` int(11) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  `nome_usuario_fk` varchar(300) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `bloqueio_vencimento`
--

-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome_razao` varchar(100) NOT NULL,
  `nome_fantasia` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `in_estadual` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `municipio` varchar(20) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `regime` varchar(100) NOT NULL,
  `data_contrato` varchar(100) DEFAULT NULL,
  `valor_entrada` varchar(20) DEFAULT '0',
  `validacao` varchar(100) DEFAULT NULL,
  `usuario_cadastro` varchar(100) DEFAULT '''''',
  `ultima_alteracao` varchar(100) NOT NULL DEFAULT '''''',
  `vendedor` varchar(100) NOT NULL DEFAULT '''''',
  `status` int(1) NOT NULL DEFAULT 0,
  `status_pagamento` int(11) NOT NULL,
  `data_limite_liberacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `data_vencimento` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `limita_nota` int(11) DEFAULT 0,
  `limita_nota_qtde` int(11) DEFAULT 10,
  `cnpj_revenda` varchar(20) NOT NULL,
  `nivel_adm` int(11) NOT NULL DEFAULT 1,
  `ultimo_acesso` date DEFAULT NULL,
  `ultimo_acesso_hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

-- Estrutura da tabela `cliente_usuarios`
--

CREATE TABLE `cliente_usuarios` (
  `id_usuario_cli` int(11) NOT NULL,
  `nome_usuario_cli` varchar(200) NOT NULL,
  `documento_usuario_cli` varchar(100) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `nome_cliente_fk` varchar(300) NOT NULL,
  `email_usuario_cli` varchar(200) NOT NULL,
  `senha_usuario_cli` varchar(50) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente_usuarios`
--

-- Estrutura da tabela `estacoes`
--

CREATE TABLE `estacoes` (
  `IDEstacoes` int(11) NOT NULL,
  `IDCliente` int(11) DEFAULT NULL,
  `Serial` varchar(65) DEFAULT NULL,
  `Descricao` varchar(85) DEFAULT NULL,
  `Status` char(1) DEFAULT 'D' COMMENT 'A = Ativo\nD = Desativado\n',
  `acesso` datetime DEFAULT NULL,
  `cadastro` datetime DEFAULT current_timestamp(),
  `CNPJ` varchar(45) DEFAULT NULL,
  `Estacoescol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estacoes`
--

-- Estrutura da tabela `liberacao_sistema`
--

CREATE TABLE `liberacao_sistema` (
  `id_liberacao` int(11) NOT NULL,
  `id_sistema_fk` int(11) NOT NULL,
  `nome_sistema_fk` varchar(400) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `nome_cliente_fk` varchar(400) NOT NULL,
  `id_usuario_cliente_fk` int(11) NOT NULL,
  `nome_usuario_cliente_fk` varchar(400) NOT NULL,
  `validade_sistema` datetime NOT NULL,
  `codigo_liberacao` varchar(200) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `liberacao_sistema`
--

-- Estrutura da tabela `registro_bloqueio`
--

CREATE TABLE `registro_bloqueio` (
  `id_registro` int(11) NOT NULL,
  `tipo_registro` int(11) NOT NULL,
  `observacao_registro` varchar(300) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  `nome_usuario_fk` varchar(300) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `nome_cliente_fk` varchar(300) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `registro_bloqueio`
--

-- Estrutura da tabela `representantes`
--

CREATE TABLE `representantes` (
  `id_representante` int(11) NOT NULL,
  `nome_representante` varchar(300) NOT NULL,
  `cnpj_representante` varchar(100) NOT NULL,
  `endereco_representante` varchar(200) NOT NULL,
  `complemento_representante` varchar(100) NOT NULL,
  `numero_representante` int(11) NOT NULL,
  `bairro_representante` varchar(200) NOT NULL,
  `municipio_representante` varchar(200) NOT NULL,
  `estado_representante` varchar(100) NOT NULL,
  `telefone_representante` varchar(100) NOT NULL,
  `email_representante` varchar(200) NOT NULL,
  `senha_representante` varchar(100) NOT NULL,
  `status_representante` int(11) NOT NULL,
  `nivel_adm` int(11) NOT NULL DEFAULT 1,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `representantes`
--

-- Estrutura da tabela `sistemas`
--

CREATE TABLE `sistemas` (
  `id_sistema` int(11) NOT NULL,
  `id_unico_sistema` int(11) NOT NULL,
  `nome_sistema` varchar(400) NOT NULL,
  `status_sistema` int(11) NOT NULL,
  `nivel_adm` int(11) NOT NULL DEFAULT 1,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sistemas`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema_representantes`
--

CREATE TABLE `sistema_representantes` (
  `id_sistema_r` int(11) NOT NULL,
  `id_unico_sistema_r` int(11) NOT NULL,
  `nome_sistema_r` varchar(200) NOT NULL,
  `id_representante_fk` int(11) NOT NULL,
  `nome_representante_fk` varchar(200) NOT NULL,
  `cnpj_revenda` varchar(200) NOT NULL,
  `nivel_adm` int(11) NOT NULL DEFAULT 1,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sistema_representantes`
--

-- Estrutura da tabela `terminais`
--

CREATE TABLE `terminais` (
  `codigo` int(11) NOT NULL,
  `terminal` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nomePC` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dataalt` timestamp NULL DEFAULT NULL,
  `status` int(1) NOT NULL,
  `id` int(11) NOT NULL,
  `maquina` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `terminais`
--

--
-- Estrutura da tabela `token`
--

CREATE TABLE `token` (
  `idtoken` int(11) NOT NULL,
  `Aplicacao` varchar(45) DEFAULT NULL,
  `pw` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT 'A' COMMENT 'A = Ativo\nD = Desativado\nM = Manutenção'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `token`
--

-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(200) NOT NULL,
  `email_usuario` varchar(200) NOT NULL,
  `senha_usuario` varchar(100) NOT NULL,
  `nivel_acesso` int(11) NOT NULL,
  `status_usuario` int(11) NOT NULL,
  `cnpj_revenda` varchar(200) NOT NULL,
  `data_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `wp_usermeta`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `wp_users`
--


--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `arquivo_representantes`
--
ALTER TABLE `arquivo_representantes`
  ADD PRIMARY KEY (`id_arquivo`);

--
-- Índices para tabela `bloqueio_vencimento`
--
ALTER TABLE `bloqueio_vencimento`
  ADD PRIMARY KEY (`id_bloqueio`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente_usuarios`
--
ALTER TABLE `cliente_usuarios`
  ADD PRIMARY KEY (`id_usuario_cli`);

--
-- Índices para tabela `estacoes`
--
ALTER TABLE `estacoes`
  ADD PRIMARY KEY (`IDEstacoes`);

--
-- Índices para tabela `liberacao_sistema`
--
ALTER TABLE `liberacao_sistema`
  ADD PRIMARY KEY (`id_liberacao`);

--
-- Índices para tabela `registro_bloqueio`
--
ALTER TABLE `registro_bloqueio`
  ADD PRIMARY KEY (`id_registro`);

--
-- Índices para tabela `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id_representante`);

--
-- Índices para tabela `sistemas`
--
ALTER TABLE `sistemas`
  ADD PRIMARY KEY (`id_sistema`);

--
-- Índices para tabela `sistema_representantes`
--
ALTER TABLE `sistema_representantes`
  ADD PRIMARY KEY (`id_sistema_r`);

--
-- Índices para tabela `terminais`
--
ALTER TABLE `terminais`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`idtoken`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices para tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices para tabela `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arquivo_representantes`
--
ALTER TABLE `arquivo_representantes`
  MODIFY `id_arquivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `bloqueio_vencimento`
--
ALTER TABLE `bloqueio_vencimento`
  MODIFY `id_bloqueio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `cliente_usuarios`
--
ALTER TABLE `cliente_usuarios`
  MODIFY `id_usuario_cli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estacoes`
--
ALTER TABLE `estacoes`
  MODIFY `IDEstacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `liberacao_sistema`
--
ALTER TABLE `liberacao_sistema`
  MODIFY `id_liberacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `registro_bloqueio`
--
ALTER TABLE `registro_bloqueio`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id_representante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sistemas`
--
ALTER TABLE `sistemas`
  MODIFY `id_sistema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `sistema_representantes`
--
ALTER TABLE `sistema_representantes`
  MODIFY `id_sistema_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `terminais`
--
ALTER TABLE `terminais`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `BLOQUEIO` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-08-02 05:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN UPDATE `clientes` SET `status`= '0', `status_pagamento` = '0' WHERE `data_vencimento` >= (SELECT CURDATE()+10) AND status != '0'; END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
