class Article < ActiveRecord::Base
  belongs_to :articletype
  belongs_to :author
end
