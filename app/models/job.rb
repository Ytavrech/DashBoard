class Job < ApplicationRecord  
    has_many :applicants
    belongs_to :user
    validates :title, presence: true
    validates :company, presence: true
    validates :experience, presence: true
    validates :salary, presence: true
end
