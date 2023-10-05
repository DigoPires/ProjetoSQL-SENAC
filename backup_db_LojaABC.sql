-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/10/2023 às 22:09
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_lojaabc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionarios`
--

CREATE TABLE `tb_funcionarios` (
  `cod_func` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `d_Nasc` date DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `numero` char(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_funcionarios`
--

INSERT INTO `tb_funcionarios` (`cod_func`, `nome`, `email`, `cpf`, `d_Nasc`, `endereco`, `cep`, `numero`, `bairro`, `estado`, `cidade`) VALUES
(1, 'Rodrigo Pires', 'rodrigo.pfigueiredo1@senacsp.edu.br', '192.824.982-09', '2023-10-05', 'Rua João Batista Franco', '04842-230', '384', 'Parque Grajaú', 'SP', 'São Paulo'),
(2, 'Rafaela Alves', 'rafaela.alves@senacsp.edu.br', '294.526.186-29', '2023-10-05', 'Rua João Batista Franco', '04842-230', '362', 'Parque Grajaú', 'SP', 'São Paulo'),
(3, 'Vitor Teixeira', 'vitor.teixeira@senacsp.edu.br', '420.124.529-67', '2023-10-05', 'Rua João Batista Franco', '04842-230', '323', 'Parque Grajaú', 'SP', 'São Paulo'),
(4, 'Julio Machado', 'julio.machado@gmail.com', '342.512.509-79', '2023-10-05', 'Rua João Batista Franco', '04842-230', '462', 'Parque Grajaú', 'SP', 'São Paulo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  ADD PRIMARY KEY (`cod_func`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  MODIFY `cod_func` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
