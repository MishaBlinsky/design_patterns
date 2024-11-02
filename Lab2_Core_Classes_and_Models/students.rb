class Student
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
    def get_last_name
        @last_name
    end
    def set_last_name (last_name)
        @last_name = last_name
    end
    def get_first_name
        @first_name
    end
    def set_first_name (first_name)
        @first_name = first_name
    end
    def get_patronimyc
        @patronimyc
    end
    def set_patronimyc (patronimyc)
        @patronimyc = patronimyc
    end
    def get_id
        @id
    end
    def set_id (id)
        @id = id
    end
    def get_phone
        @phone
    end
    def set_phone (phone)
        @phone = phone
    end
    def get_telegram
        @telegram
    end
    def set_telegram (telegram)
        @telegram = telegram
    end
    def get_email
        @email
    end
    def set_email (email)
        @email = email
    end
    def get_git
        @git
    end
    def set_git (git)
        @git = git
    end
end
