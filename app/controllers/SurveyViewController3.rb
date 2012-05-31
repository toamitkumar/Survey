class SurveyViewController3 < UITableViewController
	include Extensions

	# outlet
	attr_accessor :delegate, :segmentCtrl1, :segmentCtrl2, :segmentCtrl3

	def viewDidLoad
		super
		# changeNavigationBarBackButtonText
		if(Survey.instance.answers.has_key?(:q3) and !Survey.instance.answers[:q3].empty?)
			selections = Survey.instance.answers[:q3]

			updateSegmentValue(@segmentCtrl1, selections[0])
			updateSegmentValue(@segmentCtrl2, selections[1])
			updateSegmentValue(@segmentCtrl3, selections[2])
		else
			Survey.instance.answers[:q3] = []
		end
	end

	def segmentCtrl1Changed(sender)
		Survey.instance.answers[:q3][0] = sender.selectedSegmentIndex
	end

	def segmentCtrl2Changed(sender)
		Survey.instance.answers[:q3][1] = sender.selectedSegmentIndex
	end

	def segmentCtrl3Changed(sender)
		Survey.instance.answers[:q3][2] = sender.selectedSegmentIndex
	end

	protected
	def updateSegmentValue(sender, index)
		sender.selectedSegmentIndex = (index || 0)
	end

end