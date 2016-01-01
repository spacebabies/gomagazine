class Author < ActiveRecord::Base
  has_many :articles

  to_param :name
end
