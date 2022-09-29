class Applicant < ApplicationRecord
    belongs_to :job
    validates :name, presence: true
    validates :lastname, presence: true
    validates :city , presence: true
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }
end