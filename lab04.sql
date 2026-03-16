-- Добавление данных в таблицы groups и в students
INSERT INTO `groups` (name, head_student_id) VALUES ('Группа 1', 1);
INSERT INTO `students` (year_of_admission, passport, inn, learning_format, group_id, qualification) VALUES ('2025-09-01', '123456789', '123456789012', 1, 1,'bachelor`s degree');

-- просмотр таблиц
SELECT * FROM `groups`;
SELECT * FROM `students`;

-- обновление
UPDATE `students` SET  course = 2 WHERE id=1;
UPDATE `groups` SET  course = 2 WHERE id=1;

-- Удаление
DELETE FROM `students` WHERE id=1;

-- JOIN операция объединения
SELECT s.id, s.passport, s.inn, g.name
FROM `students` AS s
INNER JOIN `groups` AS g ON s.group_id = g.id
ORDER BY g.name DESC;

-- LEFT JOIN
SELECT s.id, s.passport, s.inn, g.name
FROM `students` AS s
INNER JOIN `groups` AS g ON s.group_id = g.id
ORDER BY g.name;

-- RIGHT JOIN
SELECT s.id, s.passport, s.inn, g.name
FROM `students` AS s
INNER JOIN `groups` AS g ON s.group_id = g.id
