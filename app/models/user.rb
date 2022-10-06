class User < ApplicationRecord
  has_many :jobs
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
 
  enum role: [:employer, :applicant]
  after_initialize :set_default_role, :if => :new_record?
  
  private
  def set_default_role
    self.role ||= :employer
  end
end
