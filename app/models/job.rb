class Job < ApplicationRecord  
    has_many :applicants

    validates :title, presence: true
    validates :company, presence: true
    # validates :url, presence: true, uniqueness: true  

end
