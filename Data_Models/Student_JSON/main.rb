require_relative 'student_list_JSON.rb'
stud1 = Student.new( "id": 7, "first_name": "Morales", "last_name": "Miles", "birth_date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
stud2 = Student.new( "id": 8, "first_name": "Morales", "last_name": "Miles", "birth_date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
json_test = Students_list_JSON.new("/Users/eduardagejkin/Desktop/ruby/l4_Models/Student_JSON/students.json")
json_test.add_student(stud1)
json_test.update_student(4, stud2)
json_test.sort_by_full_name!
puts json_test.get_student_short_count
puts('--------')
data_list = json_test.get_k_n_student_short_list(1, 5)
data_table = data_list.get_data
for i in (0..data_table.row_count-1)
  for j in (0..data_table.col_count-1)
    print("#{data_table.get_element(i, j)}  | ")
  end
  puts
end
puts(json_test.get_student_by_id(4))
json_test.write_to_file