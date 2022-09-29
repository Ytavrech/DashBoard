class Job < ApplicationRecord  
    # has_many :applicants

    validates :title, presence: true
    validates :company, presence: true
    validates :url, presence: true, uniqueness: true  
    enum status: {
        pending: 0,
        accepted: 1,
        rejected: 2
      }
end
