class Student_base
  attr_reader :id, :git, :contact
  def initialize(id: nil, git: nil, contact: nil)
    @id = id
    @git = git
    @contact = contact
  end
  def validate
    unless Student_base.has_git?(@git)
        raise ArgumentError, "ID: #{id} - There must be Git-repository."
    end
    unless Student_base.has_contact?(@contact)
        raise ArgumentError, "ID: #{id} - There must be at least one contact (phone, telegram, email)."
    end
  end
  def self.has_git?(git)
    !git.nil?
  end
  def self.has_contact?(contact)
    !contact.nil?
  end
end
