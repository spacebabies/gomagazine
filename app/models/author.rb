class Author < ActiveRecord::Base
  has_many :articles

  to_param :name

  def initials
    name.split.map { |n| n[0] }.join
  end
end
