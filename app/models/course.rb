class Course < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    
    has_one_attached :image_course

end
