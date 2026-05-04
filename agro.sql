-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/04/2026 às 02:22
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agro`
--
CREATE DATABASE IF NOT EXISTS `agro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `agro`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agricultor`
--

DROP TABLE IF EXISTS `agricultor`;
CREATE TABLE `agricultor` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `areaplantio`
--

DROP TABLE IF EXISTS `areaplantio`;
CREATE TABLE `areaplantio` (
  `id` int(11) NOT NULL,
  `produtor` int(11) NOT NULL,
  `insumo` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `insumo`
--

DROP TABLE IF EXISTS `insumo`;
CREATE TABLE `insumo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(35) DEFAULT NULL,
  `tipoinsumo` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipoinsumo`
--

DROP TABLE IF EXISTS `tipoinsumo`;
CREATE TABLE `tipoinsumo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipoinsumo`
--

INSERT INTO `tipoinsumo` (`id`, `descricao`) VALUES
(1, 'Adubo'),
(2, 'Semente');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agricultor`
--
ALTER TABLE `agricultor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `areaplantio`
--
ALTER TABLE `areaplantio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agricultor_areaplantio` (`produtor`),
  ADD KEY `insumo_areaplantio` (`insumo`);

--
-- Índices de tabela `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insumo_tipoinsumo` (`tipoinsumo`);

--
-- Índices de tabela `tipoinsumo`
--
ALTER TABLE `tipoinsumo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agricultor`
--
ALTER TABLE `agricultor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `areaplantio`
--
ALTER TABLE `areaplantio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `insumo`
--
ALTER TABLE `insumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipoinsumo`
--
ALTER TABLE `tipoinsumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `areaplantio`
--
ALTER TABLE `areaplantio`
  ADD CONSTRAINT `agricultor_areaplantio` FOREIGN KEY (`produtor`) REFERENCES `agricultor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `insumo_areaplantio` FOREIGN KEY (`insumo`) REFERENCES `insumo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `insumo_tipoinsumo` FOREIGN KEY (`tipoinsumo`) REFERENCES `tipoinsumo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
