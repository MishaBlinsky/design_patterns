require_relative '../Student/student.rb'
require_relative '../Data_List/data_list_Student_short.rb'
require_relative 'DB_Client.rb'
class Students_list_db
  def get_student_by_id(id)
    student_data = DB_Client.instance.query('SELECT * FROM students WHERE id = ?', [id]).first
    student_data ? Student.new(student_data.transform_keys(&:to_sym)) : nil
  end
  def get_k_n_student_short_list(k, n)
    students_data = DB_Client.instance.query('SELECT * FROM students LIMIT ? OFFSET ?', [n, (k - 1) * n])
    students_short = students_data.map { |student| Student_short.bydb(student.transform_keys(&:to_sym)) }
    DataListStudentShort.new(students_short)
  end
  def add_student(stud)
    query = <<~SQL
      INSERT INTO students (last_name, first_name, patronymic, birth_date, phone, telegram, email, git)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    SQL
    DB_Client.instance.query(query, [stud.last_name, stud.first_name, stud.patronymic, stud.birth_date, stud.phone, stud.telegram, stud.email, stud.git])
    stud.id = DB_Client.instance.query('SELECT last_insert_rowid()').first[:last_insert_rowid]
  end
  def update_student(id, stud)
    query = <<~SQL
      UPDATE students
      SET last_name = ?, first_name = ?, patronymic = ?, birth_date = ?, phone = ?, git = ?, telegram = ?, email = ?
      WHERE id = ?
    SQL
    DB_Client.instance.query(query, [stud.last_name, stud.first_name, stud.patronymic, stud.birth_date, stud.phone, stud.git, stud.telegram, stud.email, id])
  end
  def delete_student_by_id(id)
    DB_Client.instance.query('DELETE FROM students WHERE id = ?', [id])
  end
  def get_student_count
    DB_Client.instance.query('SELECT COUNT(*) AS count FROM students')
  end
end