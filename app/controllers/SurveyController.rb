class SurveyController < UIViewController

	def prepareForSegue(segue, sender:sender)
		if(segue.identifier == "StartSurvey")
			Survey.instance.answers = {}
		end
	end

end