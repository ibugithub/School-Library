require './book_class'

describe Book do
  # Set: Common variables for the test suite
  let(:book_title) { 'Sample Book' }
  let(:book_author) { 'Jane Doe' }
  let(:book) { Book.new(book_title, book_author) }

  context 'when initializing a book' do
    it 'sets the title and author' do
      # Arrange: No additional setup required, using 'book' instance from let
      # Act: No explicit action, as it's done in the 'set' phase
      # Assert: Check whether the title and author are correctly set
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
    end

    it 'initializes an empty rentals array' do
      # Arrange: No additional setup required, using 'book' instance from let
      # Act: No explicit action, as it's done in the 'set' phase
      # Assert: Check whether the 'rentals' array is empty
      expect(book.rentals).to be_empty
    end
  end

  context 'when adding a rental to a book' do
    # Arrange: Create a test double for 'Rental'
    let(:rental) { instance_double('Rental') }

    before do
      # Arrange: Add the rental to the book's rentals array
      book.add_rental(rental)
      # Act: No explicit action needed, as it's done in the 'before' block
    end

    it 'adds the rental to the rentals array' do
      # Arrange: No additional setup required, as it's done in the 'before' block
      # Act: No explicit action, as it's done in the 'before' block
      # Assert: Check whether the rental was added to the 'rentals' array
      expect(book.rentals).to include(rental)
    end
  end
end
