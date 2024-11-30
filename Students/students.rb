require_relative 'students_base'
class Student < Student_base
    attr_reader :last_name, :first_name, :patronymic, :phone, :telegram, :email
    def initialize(last_name, first_name, patronymic: nil, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
        self.last_name = last_name
        self.first_name = first_name
        self.patronymic = patronymic
        self.id = id
        self.phone = phone
        self.telegram = telegram
        self.email = email
        self.git = git
        contact = get_pref_contact
        super(id: id, git: git, contact: contact)
    end
    def set_contacts(phone: nil, telegram: nil, email: nil, git: nil)
        self.phone = phone if phone
        self.telegram = telegram if telegram
        self.email = email if email
        self.git = git if git
    end
    def to_s
        "ID: #{@id}, Last Name: #{@last_name}, First Name: #{@first_name}, Patronymic: #{@patronymic || 'not specified'}, Phone: #{@phone || 'not specified'}, Telegram: #{@telegram || 'not specified'}, E-Mail: #{@email || 'not specified'}, Git: #{@git || 'not specified'}"
    end
    def get_info
        "#{@last_name} #{get_initials} | Git: #{@git} | Contact: #{get_pref_contact}"
    end
    def get_initials
        if @patronymic
            return "#{@first_name[0]}.#{@patronymic[0]}."
        else
            return "#{@first_name[0]}."
        end
    end
    def get_pref_contact
        if @phone
            return "(Phone) #{@phone}"
        elsif @telegram
            return "(Telegram) #{@telegram}"
        elsif @email
            return "(E-Mail) #{@email}"
        else
            return nil
        end
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
        if id.nil? || id.is_a?(Integer)
            @id = id
        else
            raise ArgumentError, "ID must be a number: #{id}"
        end
    end
    def self.name_regex_valid?(name)
        name.match?(/\A[А-Яа-яЁёA-Za-z]+\z/)
    end
    def self.phone_regex_valid?(phone)
        phone.match?(/^\+?[1-9][0-9]{7,14}$/)
    end
    def self.telegram_regex_valid?(telegram)
        telegram.match?(/\A@[\w\d_]+\z/)
    end
    def self.email_regex_valid?(email)
        email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end
    def self.git_regex_valid?(git)
        git.match?(/^[a-zA-Z][a-zA-Z0-9-]{0,38}$/)
    end
    private
    def phone=(phone)
        if phone.nil? || Student.phone_regex_valid?(phone)
            @phone = phone
        else
            raise ArgumentError, "Incorrect phone format: #{phone}"
        end
    end
    def telegram=(telegram)
        if telegram.nil? || Student.telegram_regex_valid?(telegram)
            @telegram = telegram
        else
            raise ArgumentError, "Incorrect telegram format: #{telegram}"
        end
    end
    def email=(email)
        if email.nil? || Student.email_regex_valid?(email)
            @email = email
        else
            raise ArgumentError, "Incorrect e-mail format: #{email}"
        end
    end
    def git=(git)
        if git.nil? || Student.git_regex_valid?(git)
            @git = git
        else
            raise ArgumentError, "Incorrect git format: #{git}"
        end
    end
end