require_relative 'student_short'
require_relative 'data_list_Student_short'
studshort1 = Student_short.by_string("Morales M. | Git: abas-git | Contact: +76665554433", id: 1)
studshort2 = Student_short.by_string("Zubenko M.P. | Git: mafia-git | Contact: @mafioznik", id: 2)
studshort3 = Student_short.by_string("Stone K. | Git: woke-git | Contact: +34445556677", id: 3)
student_list = DataListStudentShort.new([studshort1, studshort2, studshort3])
puts student_list.get_data().get_element(0, 3)
student_list.select(1)
student_list.select(2)
student_list.get_selected.each {|e| puts e.to_s}