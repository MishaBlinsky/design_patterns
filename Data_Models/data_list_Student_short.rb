require 'data_list'
require 'data_table'
require 'student_short'
class DataListStudentShort < DataList
  def get_names
    ["last_name_initials", "contact", "git"]
  end
  def get_data
    data4table = @data.map.with_index {|student, index| [index + 1, student.last_name_initials, student.contact, student.git]}
    DataTable.new(data4table)
  end
end