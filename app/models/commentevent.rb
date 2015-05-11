class Commentevent < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
