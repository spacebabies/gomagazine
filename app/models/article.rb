class Article < ActiveRecord::Base
  belongs_to :articletype
  belongs_to :author

  has_one :image, as: :visual
  has_many :images, as: :visual

  to_param :head

  def previous_article
    articletype.articles.order(:created_at).where.not(id: id).where("created_at < ?", created_at).last
  end

  def next_article
    articletype.articles.order(:created_at).where.not(id: id).where("created_at > ?", created_at).first
  end
end
