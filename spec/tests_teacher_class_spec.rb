require './teacher_class'

describe Teacher do
  # Arrange: Set up common variables for the tests
  let(:age) { 43 }
  let(:specialization) { 'Physics' }
  let(:teacher_name) { 'Musa' }

  context 'when initializing a teacher' do
    it 'sets attributes correctly' do
      # Act: Create a teacher instance
      teacher = Teacher.new(age, specialization, teacher_name)
      # Assert: Verify attributes are set as expected during initialization
      expect(teacher.age).to eq(age)
      expect(teacher.name).to eq(teacher_name)
      expect(teacher.instance_variable_get(:@specialization)).to eq(specialization)
    end
  end

  it 'can use services' do
    # Arrange: Create a teacher instance
    teacher = Teacher.new(age, specialization, teacher_name)
    # Act: Call the can_use_services method
    result = teacher.can_use_services
    # Assert: Verify that the result is true
    expect(result).to be(true)
  end
end
