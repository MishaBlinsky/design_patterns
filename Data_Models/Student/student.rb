require 'date'
require_relative '../Student/student_base.rb'
class Student < Student_base
    attr_reader :last_name, :first_name, :patronymic, :phone, :telegram, :email, :birth_date
    include Comparable
    def initialize(attributes = {})
        self.last_name = attributes[:last_name] 
        self.first_name = attributes[:first_name] 
        self.patronymic = attributes[:patronymic]
        self.birth_date = attributes[:birth_date]
        self.set_contacts(phone: attributes[:phone], telegram: attributes[:telegram], email: attributes[:email])
        super(id: attributes[:id], git: attributes[:git], contact: "#{attributes[:phone] || attributes[:telegram] || attributes[:email] || nil}")
    end
    def set_contacts(phone: nil, telegram: nil, email: nil)
        self.phone = phone if phone
        self.telegram = telegram if telegram
        self.email = email if email
        self.contact = "#{@phone || @telegram || @email || nil}"
    end
    def to_s
        "ID: #{@id || '-'}, Last Name: #{@last_name}, First Name: #{@first_name}, Patronymic: #{@patronymic || 'not specified'}, Birth Date: #{@birth_date || 'not specified'}, Phone: #{@phone || 'not specified'}, Telegram: #{@telegram || 'not specified'}, E-Mail: #{@email || 'not specified'}, Git: #{@git || 'not specified'}"
    end
    def to_hash
        { id: , first_name: self.first_name, last_name: self.last_name, patronymic: self.patronymic, birth_date: self.birth_date, phone: self.phone, telegram: self.telegram, email: self.email, git: self.git }
    end
    def get_info
        "#{last_name_initials} | Git: #{self.git} | Contact: #{self.contact}"
    end
    def last_name_initials
        name = "#{@last_name} #{@first_name[0]}."
        name += "#{@patronymic[0]}." if @patronymic
        return name
    end
    def <=>(anOther)
        self.birth_date <=> anOther.birth_date
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
    def git=(git)
        if git.nil? || Student.git_regex_valid?(git)
            @git = git
        else
            raise ArgumentError, "Incorrect git format: #{git}"
        end
    end
    def birth_date=(birth_date)
        if birth_date.nil? || Student.date_regex_valid?(birth_date)
            @birth_date = birth_date
        else
            raise ArgumentError, "Incorrect date format #{birth_date}"    
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
    def self.date_regex_valid?(date)
        date.match?(/\d{4}-\d{2}-\d{2}/) && Date.strptime(date, '%Y-%m-%d') rescue false
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
    def contact=(contact)
        @contact = contact
    end
end