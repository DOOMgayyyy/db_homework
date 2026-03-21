const mysql = require('mysql2/promise');

class DataBase{
  constructor() {
    const host = process.env.DB_URL
    const port = process.env.DB_PORT
    const user = process.env.DB_USER
    const pass = process.env.DB_PASS
    const db = process.env.DB_NAME
    this.connection = mysql.createPool({
      host: process.env.DB_URL,
      port: process.env.DB_PORT,
      user: process.env.DB_USER,
      password: process.env.DB_PASS,
      database: process.env.DB_NAME
    });
  }
  //типы данных для переменных name: varchar(20), head_student_id: int
  async createStudentGroup(name, head_student_id) {
    await this.connection.execute("INSERT INTO `groups` (name, head_student_id) VALUES (?, ?)", [name, head_student_id]);
  }
  // типы данных year_of_admission:YYYY.MM.DD passport:char(10) inn: char(12) learning_format:BOLEAN group_id:int qualification:varchar(20)
  async createStudentProfile(year_of_admission, passport, inn, learning_format, group_id, qualification) {
    await this.connection.execute("INSERT INTO `students` (year_of_admission, passport, inn, learning_format, group_id, qualification) VALUES (?,?,?,?,?,?)",[year_of_admission, passport, inn, learning_format, group_id, qualification]);
  }

  async createTeacherProfike(direction, qualificationm, year_of_admission, passport, inn) {
    await this.connection.execute("INSERT INTO `teachers` (direction, qualificationm, year_of_admission, passport, inn) VALUES (?,?,?,?,?)", [direction, qualificationm, year_of_admission, passport, inn]);
  }

  async createGrades(student_id, subject_id, boundary_control_1, boundary_control_2, boundary_control_3, dop_points) {
    await this.connection.execute("INSERT INTO `grades` VALUES (?,?,?,?,?,?) (student_id, subject_id, boundary_control_1, boundary_control_2, boundary_control_3, dop_points)", [student_id, subject_id, boundary_control_1, boundary_control_2, boundary_control_3, dop_points]);
  }

  async createTeacherSubject(teacher_id, subject_id) {
    await this.connection.execute("INSERT INTO `teacher_subject` VALUES (?,?) (teacher_id, subject_id)", [teacher_id, subject_id]);
  }

  async createSubject(name) {
    await this.connection.execute("INSERT INTO `subjects` VALUES (?) (name)", [name]);
  }

  async deleteByID(id){
    await this.connection.execute("DELETE INTO `student` ")
  }
}
