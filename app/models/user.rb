class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
 
  enum role: [:employer, :applicant]
  after_initialize :set_default_role, :if => :new_record?
  private
  def set_default_role
    self.role ||= :employer
  end
end
