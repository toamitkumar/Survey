class Survey
	attr_accessor :answers, :questions


	def self.instance(_data={})
		@@instance ||= new(_data)
	end

	private
	def initialize(answers={})
		@questions = load_questions
		NSLog("===================")
		puts @questions.inspect
		@answers = {}
		@answers.merge!(answers)
	end

	def load_questions
		questions = NSBundle.mainBundle.pathForResource('questions', ofType:'json')
		errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(questions, options:NSDataReadingUncached, error:errorPointer)

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