require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'Author', with: 'Nolan'
    fill_in 'Price', with: '1.2'

    click_on 'Create Book'
    expect(page).to have_content('Book Title')
    expect(page).to have_content('Nolan')
    expect(page).to have_content(1.2)

    book = Book.order("id").last
    expect(book.title).to eq('Book Title')
    expect(book.author).to eq('Nolan')
    expect(book.price).to eq(1.2)
    end

end
