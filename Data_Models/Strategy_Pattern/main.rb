require_relative 'Student_list_base.rb'
require_relative 'file_json.rb'
require_relative 'file_yaml.rb'
stud1 = Student.new( "id": 7, "first_name": "Morales", "last_name": "Miles", "birth_date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
list_test = Students_list_base.new("/Users/eduardagejkin/Desktop/ruby/l4_Models/Student_YAML/students.yaml", YAML_strategy)
list_test.add_student(stud1)
list_test.write
data_list = list_test.get_k_n_student_short_list(2, 2)
data_table = data_list.get_data
for i in (0..data_table.row_count-1)
  for j in (0..data_table.col_count-1)
    print("#{data_table.get_element(i, j)}  | ")
  end
  puts
end