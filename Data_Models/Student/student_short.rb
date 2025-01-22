require_relative 'student_base.rb'
class Student_short < Student_base
  attr_reader :last_name_initials
  private_class_method :new
  def initialize(last_name_initials, git, contact, id: nil)
    @last_name_initials = last_name_initials
    super(id: id, git: git, contact: contact)
  end
  def self.by_string(info_str, id: nil)
    parts = Student_short.parse_info(info_str)
    new(parts[:last_name_initials], parts[:git], parts[:contact], id: id )
  end
  def self.by_student(student)
    if student.is_a?(Student)
      Student_short.by_string(student.get_info, id: student.id)
    end
  end
  def to_s
    "ID: #{self.id || '-'} | Last Name Initials: #{self.last_name_initials} | Git: #{self.git} | Contact: #{self.contact}"
  end
  private
  def self.parse_info(info_str)
    user_parts = info_str.split('|').map(&:strip)
    if user_parts.size == 3
      last_name_initials = user_parts[0]
      git = user_parts[1].split(':').last.strip
      git = nil if git == "Git"
      contact = user_parts[2].split(':').last.strip
      contact = nil if contact == "Contact"
      { last_name_initials: last_name_initials, git: git, contact: contact }
    else
      raise ArgumentError, "Incorrect string format"
    end
  end
end