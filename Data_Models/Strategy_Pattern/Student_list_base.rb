require_relative '../Student/Student.rb'
require_relative '../Data_List/data_list_Student_short.rb'
class Students_list_base
  def initialize(file_path, strategy)
    self.file_path, @strategy = file_path, strategy
    self.students = read
  end
  def read(file_path=self.file_path)
    @strategy.read(file_path)
  end
  def write(file_path=self.file_path, data=self.students.map(&:to_hash))
    @strategy.write(file_path, data)
  end
  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end
  def get_k_n_student_short_list(k, n, data_list = nil)
    students_short = self.students[(k - 1) * n, n].map { |student| Student_short.by_student(student) }
    data_list ||= DataListStudentShort.new(students_short)
    data_list
  end
  def sort_by_full_name!
    self.students.sort_by! { |student| student.last_name_initials }
  end
  def add_student(student)
    student.id = ( self.students.map(&:id).max || 0 ) + 1
    self.students << student
  end
  def update_student(id, updated_student)
    index = self.students.find_index { |student| student.id == id }
    raise IndexError, 'Student not found' unless index
    updated_student.id = id
    self.students[index] = updated_student
  end
  def delete_student(id)
    @students.reject! { |student| student.id == id }
  end
  def get_student_short_count
    self.students.size
  end
  private
  attr_accessor :file_path, :students
end