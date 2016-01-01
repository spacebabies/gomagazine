class Article < ActiveRecord::Base
  belongs_to :articletype
  belongs_to :author

  to_param :head
end
