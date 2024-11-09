require_relative 'students'
begin
    student1 = Student.new("Morales", "Miles", id: 1, phone: "+76665554433", git: "abas-git")
    puts student1
    student2 = Student.new("Zubenko", "Mihail", patronymic: "Petrovich", id: 2, phone: "1234567", git: "mafia-git")
    puts student2
rescue ArgumentError => e
    puts e.message
end
