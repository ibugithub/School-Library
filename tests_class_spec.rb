require './class_room'  
require './student_class' 

describe 'Classroom' do
  let(:classroom_label) { 'Math101' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new(18, classroom, true, 'John Doe') }

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom of the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end