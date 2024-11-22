require_relative 'students'
require_relative 'students_short'
begin
    student1 = Student.new("Morales", "Miles", id: 1, phone: "+76665554433", git: "abas-git")
    puts student1
    student2 = Student.new("Zubenko", "Mihail", patronymic: "Petrovich", id: 2, telegram: "@mafioznik", git: "mafia-git")
    puts student2
    student3 = Student.new("Stone", "Karen", id: 3, email: "ceoofsjw@notok.com", git: "woke-git")
    puts student3
    student1.set_contacts(phone: "+34445556677", telegram: "@ourspider")
    puts "Updated student info:"
    puts student1
    puts student2.get_info
    student_short1 = Student_short.new(student3)
    puts student_short1.last_name_initials
    puts "Git: #{student_short1.git}"
    puts student_short1.contact
rescue ArgumentError => e
    puts e.message
end
