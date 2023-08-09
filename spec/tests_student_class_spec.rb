require '.\student_class'

describe Student do
  # Arrange: Set up common variables for the tests
  let(:classroom) { instance_double('Classroom') }
  let(:age) { 16 }
  let(:permission) { true }
  let(:student_name) { 'John Doe' }

  context 'when initializing a student' do
    it 'sets attributes and adds student to classroom' do
      # Arrange: Set up classroom double and expected behavior
      expect(classroom).to receive(:add_student)
      # Act: Create a student instance
      student = Student.new(age, classroom, permission, student_name)
      # Assert: Verify attributes are set and classroom's add_student was called
      expect(student.age).to eq(age)
      expect(student.name).to eq(student_name)
      expect(student.classroom).to eq(classroom)
    end
  end

  context 'when changing student classroom' do
    it 'updates classroom and adds student to new classroom' do
      # Arrange: Create two classroom doubles and set up expected behavior
      old_classroom = instance_double('Classroom', students: [])
      new_classroom = instance_double('Classroom', students: [])
      allow(old_classroom).to receive(:add_student)
      allow(new_classroom).to receive(:add_student)
      
      student = Student.new(age, old_classroom, permission, student_name)
      
      # Act: Update student's classroom
      student.classroom = new_classroom
      
      # Assert: Verify the new classroom is set and students are updated
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
      expect(old_classroom.students).not_to include(student)
    end
  end

  it 'plays hooky' do
    # Arrange: Create a student instance
    old_classroom = instance_double('Classroom', students: [])
    allow(old_classroom).to receive(:add_student)
    student2 = Student.new(age, old_classroom, permission, student_name)
    # Act: Call the play_hooky method
    result = student2.play_hooky
    # Assert: Verify the result matches the expected output
    expect(result).to eq('¯(ツ)/¯')
  end
end
