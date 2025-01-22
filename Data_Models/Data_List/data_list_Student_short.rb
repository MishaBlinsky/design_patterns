require_relative 'data_list.rb'
require_relative '../Student/student_short.rb'
class DataListStudentShort < DataList
  def initialize(data)
    super(data)
  end
  def get_names
    ["id", "last_name_initials", "git", "contact"]
  end
  def data_row(index)
    [index + 1, @data[index].last_name_initials, @data[index].git, @data[index].contact]
  end
end