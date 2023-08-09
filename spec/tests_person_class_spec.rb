require './person_class'

describe Person do
  # Arrange: Set up a common instance of Person for the tests
  let(:person) { Person.new(15, 'John Doe', parent_permission: true) }

  context 'when initializing a person' do
    it 'sets the attributes correctly' do
      # Assert: Check if the attributes are set as expected during initialization
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(15)
      expect(person.parent_permission).to be(true)
      expect(person.rentals).to be_empty
      expect(person.identity).to be_instance_of(String)
    end
  end

  context 'when checking if a person can use services' do
    it 'returns true with permission' do
      # Act: No action required as the setup provides a person with permission
      # Assert: Verify that the can_use_services method returns true
      expect(person.can_use_services).to be(true)
    end

    it 'returns false without permission' do
      # Arrange: Modify the person's permission to simulate a scenario
      person.parent_permission = false
      # Act: No additional action required
      # Assert: Verify that the can_use_services method returns false
      expect(person.can_use_services).to be(false)
    end
  end

  it 'returns correct name' do
    # Act: No specific action required, as the setup provides the name
    # Assert: Verify that the correct_name method returns the correct name
    expect(person.correct_name).to eq('John Doe')
  end

  it 'adds a rental to rentals' do
    # Arrange: Create a test double for Rental
    rental = double('Rental')
    # Act: Add the rental to person's rentals
    person.add_rental(rental)
    # Assert: Verify that the rental is added to the rentals array
    expect(person.rentals).to include(rental)
  end

  describe '#of_ages?' do
    it 'returns true when age is 18 or older' do
      # Arrange: Set the person's age to simulate the scenario
      person.age = 25
      # Act: Call the private method using send
      # Assert: Verify that the private method's result is true
      expect(person.send(:of_ages?)).to be(true)
    end

    it 'returns false when age is under 18' do
      # Arrange: Set the person's age to simulate the scenario
      person.age = 15
      # Act: Call the private method using send
      # Assert: Verify that the private method's result is false
      expect(person.send(:of_ages?)).to be(false)
    end
  end
end
