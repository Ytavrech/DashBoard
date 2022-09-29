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
  # after_initialize do
  #   if self.new_record?
  #     self.role ||= :job
  #   end
  # end

  #devise :two_factor_authenticatable, :two_factor_backupable,
  # otp_backup_code_length: 10, otp_number_of_backup_codes: 10,
  # :otp_secret_encryption_key => ENV['OTP_SECRET_KEY']
end
