require 'rails_helper'

RSpec.describe Author do
  it "has initials from name" do
    author = Author.new name: "Joost van Baaij"
    expect(author.initials).to eq("JvB")
  end
end
