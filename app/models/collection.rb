class Collection < ActiveRecord::Base
    has_many :trails 
    belongs_to :user

end
