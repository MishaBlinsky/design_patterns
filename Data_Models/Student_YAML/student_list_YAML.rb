require 'yaml'
require_relative '../Student/student.rb'
require_relative '../Data_List/data_list_Student_short.rb'
class Students_list_YAML
  def initialize(file_path)
    self.file_path = file_path
    self.students = read_from_file
  end
  def read_from_file
    File.exist?(file_path) ? YAML.safe_load(File.read(self.file_path), permitted_classes: [Date, Symbol]).map { |data| Student.new(**data) } : []
  end
  def write_to_file
    File.write(self.file_path, self.students.map { |student| student.to_hash }.to_yaml)
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