class Articletype < ActiveRecord::Base
  has_many :articles

  to_param :description
end
