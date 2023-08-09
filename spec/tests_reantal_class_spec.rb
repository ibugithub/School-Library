require '.\rental_class'

describe Rental do
  # Arrange: Set up common variables for the tests
  let(:date) { '2023-08-09' }
  let(:book) { instance_double('Book') }
  let(:person) { instance_double('Person') }

  context 'when initializing a rental' do
    it 'sets attributes and adds rental to book and person' do
      # Arrange: Set up book and person doubles and expected behavior
      allow(book).to receive(:add_rental)
      allow(person).to receive(:add_rental)
      
      # Act: Create a rental instance
      rental = Rental.new(date, book, person)
      
      # Assert: Verify attributes are set and add_rental methods were called
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book).to have_received(:add_rental).with(rental)
      expect(person).to have_received(:add_rental).with(rental)
    end
  end
end
