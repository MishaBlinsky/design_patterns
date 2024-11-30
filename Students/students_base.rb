class Student_base
  attr_reader :id, :git, :contact
  def initialize(id: nil, git: nil, contact: nil)
    @id = id
    @git = git
    @contact = contact
  end
  def validate
    has_git? & has_contact?
  end
  def has_git?
    !@git.nil?
  end
  def has_contact?
    !@contact.nil?
  end
end
