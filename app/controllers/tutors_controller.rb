class TutorsController < ApplicationController

	def index

		render json: {}, status: 200
	end

	def create
		@tutor = Tutor.new(tutor_params)
		if @tutor.save
			render json: {}, status: :created 
		else
			render json: {}, status: 422
		end
	end

	private
	def tutor_params
		params.require(:tutor).permit(:name)
	end

end