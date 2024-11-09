class Student
    attr_accessor :last_name, :first_name, :patronymic, :id, :phone, :telegram, :email, :git
    def initialize(last_name, first_name, patronymic, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
        @last_name = last_name
        @first_name = first_name
        @patronymic = patronymic
        @id = id
        @phone = phone
        @telegram = telegram
        @email = email
        @git = git
    end
    def to_s
    "ID: #{@id}, Last Name: #{@last_name}, First Name: #{@first_name}, Patronymic: #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, E-Mail: #{@email}, Git: #{@git}"
    end
end
