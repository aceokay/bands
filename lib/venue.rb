class venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
end
