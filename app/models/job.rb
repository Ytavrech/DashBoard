class Job < ApplicationRecord  
    has_many :applicants
    belongs_to :user
    validates :title, presence: true
    validates :company, presence: true
    # validates :url, presence: true, uniqueness: true  

end
