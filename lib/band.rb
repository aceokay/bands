class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  before_validation(:normalize)
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})
  
private
  define_method(:normalize) do
    self.name=(name().strip().split(/(\W)/).map(&:capitalize).join)
  end
end
