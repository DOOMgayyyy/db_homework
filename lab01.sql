CREATE TABLE `groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(20) NOT NULL,
  `head_student_id` INT UNSIGNED UNIQUE
);
CREATE TABLE `students` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `course` CHAR(1) NOT NULL DEFAULT '1',
  `year_of_admission` DATE NOT NULL,
  `passport` CHAR(10) NOT NULL UNIQUE,
  `inn` CHAR(12) NOT NULL UNIQUE,
  `learning_format` BOOLEAN NOT NULL,
  `group_id` INT UNSIGNED NOT NULL,
  `qualification` VARCHAR(20) NOT NULL,
  FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`)
);

CREATE TABLE `teachers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `direction` VARCHAR(20) NOT NULL,
  `qualification` VARCHAR(20) NOT NULL,
  `year_of_admission` DATE NOT NULL,
  `passport` CHAR(10) NOT NULL UNIQUE,
  `inn` CHAR(12) NOT NULL UNIQUE
);
CREATE TABLE `subjects` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `grades` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `student_id` INT UNSIGNED NOT NULL,
  `subject_id` INT UNSIGNED NOT NULL,
  `boundary_control_1` INT UNSIGNED DEFAULT 0,
  `boundary_control_2` INT UNSIGNED DEFAULT 0,
  `boundary_control_3` INT UNSIGNED DEFAULT 0,
  `dop_points` INT UNSIGNED DEFAULT 0,
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`),
  FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`)
);

CREATE TABLE `teacher_subject` (
  `teacher_id` INT UNSIGNED NOT NULL,
  `subject_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`teacher_id`, `subject_id`),
  FOREIGN KEY (`teacher_id`) REFERENCES `teachers`(`id`),
  FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`)
);