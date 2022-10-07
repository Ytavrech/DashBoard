class User < ApplicationRecord
  has_many :jobs
  # has_many :applicants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
 
  enum role: [:employer, :applicant]
  after_initialize :set_default_role, :if => :new_record?
  
  private
  def set_default_role
    self.role ||= :employer
  end
end
