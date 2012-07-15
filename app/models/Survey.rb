class Survey
	attr_accessor :answers, :questions, :survey_data


	def self.instance(_data={})
		@@instance ||= new(_data)
	end

	private
	def initialize(answers={})
		@survey_data = load_survey_data
		@questions = @survey_data["questions"]
		@answers = {}
		@answers.merge!(answers)
	end

	def load_survey_data
		survey_data = NSBundle.mainBundle.pathForResource('survey', ofType:'json')
		errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(survey_data, options:NSDataReadingUncached, error:errorPointer)

    unless data
      printError errorPointer[0]
      return {}
    end
    
    json = NSJSONSerialization.JSONObjectWithData(data, options:NSDataReadingUncached, error:errorPointer)

    unless json
      printError errorPointer[0]
      return {}
    end

		json
	end
	
end