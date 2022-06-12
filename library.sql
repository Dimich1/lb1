-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 12 2022 г., 14:43
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `ID_Authors` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`ID_Authors`, `name`) VALUES
(9, 'Author1'),
(10, 'Author2'),
(11, 'Author3'),
(12, 'Author4');

-- --------------------------------------------------------

--
-- Структура таблицы `book_authors`
--

CREATE TABLE `book_authors` (
  `id` int(11) NOT NULL,
  `FID_Book` int(11) NOT NULL,
  `FID_Authors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book_authors`
--

INSERT INTO `book_authors` (`id`, `FID_Book`, `FID_Authors`) VALUES
(11, 17, 9),
(12, 18, 10),
(13, 19, 11),
(14, 20, 12),
(15, 17, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `literatures`
--

CREATE TABLE `literatures` (
  `ID_Book` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` date DEFAULT NULL,
  `year` date DEFAULT NULL,
  `publisher` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ISBN` text DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `literate` text NOT NULL,
  `FID_Resourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `literatures`
--

INSERT INTO `literatures` (`ID_Book`, `name`, `date`, `year`, `publisher`, `quantity`, `ISBN`, `number`, `literate`, `FID_Resourse`) VALUES
(17, 'Book1', '2022-06-01', NULL, 'Publisher1', 45, '978-3-16-148410-0', NULL, 'Book', 13),
(18, 'Book2', '2019-06-04', NULL, 'Publisher2', 55, '', NULL, 'Book', 14),
(19, 'Journal1', '2020-06-10', NULL, 'Publisher3', 53, NULL, 1, 'Journal', 15),
(20, 'Journal2', '2018-06-05', NULL, 'Publisher4', 543, '978-3-16-148410-4', NULL, 'Journal', 16),
(21, 'Newspaper1', '2022-06-01', NULL, NULL, NULL, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `resourses`
--

CREATE TABLE `resourses` (
  `ID_Resourse` int(11) NOT NULL,
  `title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `resourses`
--

INSERT INTO `resourses` (`ID_Resourse`, `title`) VALUES
(13, 'ResOne'),
(14, 'ResTwo'),
(15, 'ResThree'),
(16, 'ResFour'),
(17, 'ResFive'),
(18, 'ResOne'),
(19, 'ResTwo'),
(20, 'ResThree'),
(21, 'ResFour'),
(22, 'ResFive');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID_Authors`);

--
-- Индексы таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FID_Book` (`FID_Book`),
  ADD KEY `FID_Authors` (`FID_Authors`);

--
-- Индексы таблицы `literatures`
--
ALTER TABLE `literatures`
  ADD PRIMARY KEY (`ID_Book`),
  ADD UNIQUE KEY `FID_Resourse` (`FID_Resourse`);

--
-- Индексы таблицы `resourses`
--
ALTER TABLE `resourses`
  ADD PRIMARY KEY (`ID_Resourse`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `ID_Authors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `book_authors`
--
ALTER TABLE `book_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `literatures`
--
ALTER TABLE `literatures`
  MODIFY `ID_Book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `resourses`
--
ALTER TABLE `resourses`
  MODIFY `ID_Resourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`FID_Book`) REFERENCES `literatures` (`ID_Book`),
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`FID_Authors`) REFERENCES `authors` (`ID_Authors`);

--
-- Ограничения внешнего ключа таблицы `literatures`
--
ALTER TABLE `literatures`
  ADD CONSTRAINT `literatures_ibfk_1` FOREIGN KEY (`FID_Resourse`) REFERENCES `resourses` (`ID_Resourse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
