require_relative 'student_list_YAML.rb'
stud1 = Student.new( "id": 7, "first_name": "Morales", "last_name": "Miles", "birth_date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
stud2 = Student.new( "id": 8, "first_name": "Morales", "last_name": "Miles", "birth_date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
yaml_test = Students_list_YAML.new("/Users/eduardagejkin/Desktop/ruby/l4_Models/Student_YAML/students.yaml")
yaml_test.add_student(stud1)
yaml_test.update_student(4, stud2)
yaml_test.sort_by_full_name!
puts yaml_test.get_student_short_count
puts('--------')
data_list = yaml_test.get_k_n_student_short_list(1, 5)
data_table = data_list.get_data
for i in (0..data_table.row_count-1)
  for j in (0..data_table.col_count-1)
    print("#{data_table.get_element(i, j)}  | ")
  end
  puts
end
puts(yaml_test.get_student_by_id(4))
yaml_test.write_to_file