class Studentapplication < ActiveRecord::Base
    belongs_to :user
    validates :major, presence: true
    validates :graduation, presence: true
    validates :info, presence: true
    # validates :file, presence: true
end
