class Applicant < ApplicationRecord
    validates :name, presence: true
    validates :lastname, presence: true
    validates :city , presence: true
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }
end