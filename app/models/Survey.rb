class Survey
	attr_accessor :answers, :questions


	def self.instance(_data={})
		@@instance ||= new(_data)
	end

	private
	def initialize(answers={})
		@questions = load_questions
		@answers = {}
		@answers.merge!(answers)
	end

	def load_questions
		{}
	end
	
end