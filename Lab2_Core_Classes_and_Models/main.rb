require_relative 'students'
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
rescue ArgumentError => e
    puts e.message
end
