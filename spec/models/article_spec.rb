require 'rails_helper'

RSpec.describe Article do
  describe "previous article" do
    let(:articletype) { FactoryGirl.create :articletype }

    it "returns previous" do
      previous_article = FactoryGirl.create :article, created_at: 1.day.ago, articletype: articletype
      article = FactoryGirl.create :article, articletype: articletype
      expect(article.previous_article).to eq(previous_article)
    end

    it "is nil at the beginning" do
      article = FactoryGirl.create :article
      expect(article.previous_article).to be_nil
    end
  end

  describe "next article" do
    let(:articletype) { FactoryGirl.create :articletype }

    it "returns next" do
      next_article = FactoryGirl.create :article, created_at: 1.day.from_now, articletype: articletype
      article = FactoryGirl.create :article, articletype: articletype
      expect(article.next_article).to eq(next_article)
    end

    it "is nil at the end" do
      article = FactoryGirl.create :article
      expect(article.next_article).to be_nil
    end
  end
end
