require 'features/features_spec_helper'
 
feature "Home" do
  # context "Without books" do
  #   scenario "see warning message" do
  #     visit root_path
  #     expect(page).to have_content 'No Books, Sorry...'
  #   end
  # end

  context "With books" do
    background do
      @books = FactoryGirl.create_list(:book, 3) 
      Book.stub(:most_popular).and_return([@books.first])
      visit root_path
    end

    scenario "see book info" do
      expect(page).to have_content @books.first.title
      expect(page).to have_content @books.first.price
      expect(page).to have_content @books.first.description
      expect(page).to have_content @books.first.author.first_name
      expect(page).to have_content @books.first.author.last_name
    end
  end
end
