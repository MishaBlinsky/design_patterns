require_relative 'students'
require_relative 'students_short'
require_relative 'students_base'
begin
    student1 = Student.new("Morales", "Miles", id: 1, phone: "+76665554433", git: "abas-git")
    puts student1
    student2 = Student.new("Zubenko", "Mihail", patronymic: "Petrovich", id: 2, telegram: "@mafioznik", git: "mafia-git")
    puts student2
    student3 = Student.new("Stone", "Karen", git: "woke-git")
    puts student3
    student1.set_contacts(phone: "+34445556677", telegram: "@ourspider")
    puts "Updated student info:"
    puts student1
    student_short1 = Student_short.by_student(student2)
    puts student_short1.last_name_initials
    puts student_short1.git
    puts student_short1.contact
    puts student_short1.validate   
    student_short2 = Student_short.by_string(student3.get_info, id: 3)
    puts student_short2.last_name_initials
    puts student_short2.git
    puts student_short2.contact
    puts student_short2.validate
    studentFaker = Student.new("Zubenko", "Mihail", patronymic: "Petrovich", id: 2, telegram: "@mafioznik", git: "mafia-git")
    puts student2 == studentFaker
    puts student1 == student2
rescue ArgumentError => e
    puts e.message
end