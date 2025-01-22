require_relative 'Student_list_db.rb'
db_client = DB_Client.instance('sqlite://students.db')
db_client.setup_schema
students_list = Students_list_db.new()
stud1 = Student.new( "id": 5, "first_name": "Morales", "last_name": "Miles", "date": "2002-02-20", "telegram": "@spooder", "git": "abas-git" )
puts "--------------------------------"
data_list = students_list.get_k_n_student_short_list(1, 2)
data_table = data_list.get_data
for i in (0..data_table.row_count-1)
  for j in (0..data_table.col_count-1)
    print("#{data_table.get_element(i, j)}  | ")
  end
  puts
end
puts "--------------------------------"
students_list.update_student(4, stud1)
puts students_list.get_student_count
db_client.close