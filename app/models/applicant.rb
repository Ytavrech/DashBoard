class Applicant < ApplicationRecord
    belongs_to :job
    # belongs_to :user
    validates :name, presence: true
    validates :lastname, presence: true
    validates :city , presence: true
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }

    enum status: {
        pending: 0,
        accepted: 1,
        rejected: 2
      }
end





























