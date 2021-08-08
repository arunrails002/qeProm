class CoursesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	before_action :authenticate_user,  only: [:auth, :list_courses_tutors]
	def index
		render json: {}, status: 200
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			render json: {message: "created"}, status: :created 
		else
			render json: {message: "error"}, status: 422
		end
	end

	def courses_tutors
		@course = Course.find_or_create_by(name: params[:course])
		if @course.present?
			check_tutors_creations = {}
			(params[:tutors] || []).each do |tutor|
				if tutor.present? ? (@course.tutors << (Tutor.new(name: tutor)))  : false
					check_tutors_creations[tutor] = true
				else
					check_tutors_creations[tutor] = false
				end
			end
			if (!params[:tutors].present?) || (check_tutors_creations.values.include?(false))
				error_tutors = check_tutors_creations.select{|k,v| v == false}.keys.join(' , ') if params[:tutors].present?
				error_tutors = error_tutors.present? ? "( #{error_tutors} )" : ""
				render json: {message: "Tutor #{ error_tutors} already Assigned other course."}, status: 422
			else
				render json: {message: "all tutors are created and assigned successfully "}, status: :created 
			end
		else
			render json: {message: "error while creating course"}, status: 422
		end		
	end

	def list_courses_tutors
		all_course = Course.all
		hsh = {}
		all_course.each do |course|
		hsh[course.name] = course.try(:tutors).pluck(:name)
		end
		render json: hsh, status: 200
	end

 def auth
    render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}" }
  end
	private
	def course_params
		params.require(:course).permit(:name)
	end
  # Authorized only method
end