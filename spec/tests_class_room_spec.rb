require './class_room'  
require './student_class' 

describe Classroom do
  # arrange
  let(:classroom_label) { 'Math101' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new(18, classroom, true, 'John Doe') }

  context 'when adding a student to the classroom' do
    # act
    before do
      classroom.add_student(student)
    end

    # assert
    it 'adds the student to the classroom' do
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom of the student' do
      expect(student.classroom).to eq(classroom)
    end
  end
end
