class Student
    attr_accessor :last_name, :first_name, :patronymic, :id, :phone, :telegram, :email, :git
    def initialize(last_name, first_name, patronymic: nil, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
        self.last_name = last_name
        self.first_name = first_name
        self.patronymic = patronymic
        self.id = id
        self.phone = phone
        self.telegram = telegram
        self.email = email
        self.git = git
        validate
    end
    def to_s
        "ID: #{@id}, Last Name: #{@last_name}, First Name: #{@first_name}, Patronymic: #{@patronymic || 'not specified'}, Phone: #{@phone || 'not specified'}, Telegram: #{@telegram || 'not specified'}, E-Mail: #{@email || 'not specified'}, Git: #{@git || 'not specified'}"
    end
    def last_name=(last_name)
        if Student.name_regex_valid?(last_name)
            @last_name = last_name
        else
            raise ArgumentError, "Only letters in names: #{last_name}"
        end
    end
    def first_name=(first_name)
        if Student.name_regex_valid?(first_name)
            @first_name = first_name
        else
            raise ArgumentError, "Only letters in names: #{first_name}"
        end
    end
    def patronymic=(patronymic)
        if patronymic.nil? || Student.name_regex_valid?(patronymic)
            @patronymic = patronymic
        else
            raise ArgumentError, "Only letters in names: #{patronymic}"
        end
    end
    def id=(id)
        if id.is_a?(Integer)
            @id = id
        else
            raise ArgumentError, "ID must be a number: #{id}"
        end
    end
    def phone=(phone)
        if phone.nil? || phone.match?(/^\+?[1-9][0-9]{7,14}$/)
            @phone = phone
        else
            raise ArgumentError, "Incorrect phone format: #{phone}"
        end
    end
    def telegram=(telegram)
        if telegram.nil? || telegram.match?(/\A@[\w\d_]+\z/)
            @telegram = telegram
        else
            raise ArgumentError, "Incorrect telegram format: #{telegram}"
        end
    end
    def email=(email)
        if email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
            @email = email
        else
            raise ArgumentError, "Incorrect e-mail format: #{email}"
        end
    end
    def git=(git)
        if git.nil? || git.match?(/^[a-zA-Z0-9-]{0,38}$/)
            @git = git
        else
            raise ArgumentError, "Incorrect git format: #{git}"
        end
    end
    def self.name_regex_valid?(name)
        name.match?(/\A[А-Яа-яЁёA-Za-z]+\z/)
    end
    def git_valid?
        !git.nil?
    end
    def contact_valid?
        !phone.nil? || !telegram.nil? || !email.nil?
    end
    def validate
        unless git_valid?
            raise ArgumentError, "ID: #{id} - There must be Git-repository."
        end
        unless contact_valid?
            raise ArgumentError, "ID: #{id} - There must be at least one contact (phone, telegram, email)."
        end
    end
end
