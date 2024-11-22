require_relative 'students_base'
require_relative 'students'
class Student_short < Student_base
  attr_reader :last_name_initials
  def initialize(*args)
    if args.size == 1 && args[0].is_a?(Student)
      student = args[0]
      if student.patronymic
        @last_name_initials = "#{student.last_name} #{student.first_name[0]}.#{student.patronymic[0]}."
      else
        @last_name_initials = "#{student.last_name} #{student.first_name[0]}."
      end
      super(id: student.id, git: student.git, contact: student.get_pref_contact)
    elsif args.size == 1 && args[0].is_a?(String)
      parts = parse_info(args[0])
      @last_name_initials = parts[:last_name_initials]
      git = parts[:git]
      contact = parts[:contact]
      super(git: git, contact: contact)
    elsif args.size == 2 && args[0].is_a?(String) && args[1].is_a?(Integer)
      @id = args[1]
      parts = parse_info(args[0])
      @last_name_initials = parts[:last_name_initials]
      git = parts[:git]
      contact = parts[:contact]
      super(id: id, git: git, contact: contact)
    else
      raise ArgumentError, "Incorrect constructor arguments"
    end
  end
  private
  def parse_info(info_str)
    user_parts = info_str.split('|').map(&:strip)
    if user_parts.size == 3
      last_name_initials = user_parts[0]
      git = user_parts[1].split(':').last.strip
      if git == "Git"
        git = nil
      end
      contact = user_parts[2].split(':').last.strip
      if contact == "Contact"
        contact = nil
      end
      { last_name_initials: last_name_initials, git: git, contact: contact }
    else
      raise ArgumentError, "Incorrect string format"
    end
  end
end
