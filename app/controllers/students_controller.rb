class StudentsController < ApplicationController
  def index
    matching_students = Student.all

    @list_of_students = matching_students.order({ :created_at => :desc })

    render({ :template => "students/index.html.erb" })
  end

  def show
    @the_id = params.fetch("path_id") # :path_id

    #matching_enrollment = Enrollment.where({ :student_id => @the_id }) #changed id to student_id

    #@the_student_schedule = matching_enrollment.at(0)

    matching_students = Student.all

    @the_student = matching_students.where({ :id=> @the_id }).at(0)

    render({ :template => "students/show.html.erb" })
  end
end
