class SurveyViewController2 < UITableViewController
  include Extensions

	attr_accessor :custSlider, :webSlider

	# outlet
	attr_accessor :delegate

	def viewDidLoad
    super
    # changeNavigationBarBackButtonText
		if(Survey.instance.answers.has_key?(:q2))
			selections = Survey.instance.answers[:q2]

			@custSlider.value = selections[:cust]
			@webSlider.value = selections[:web]

			changeTrackTintColor(@custSlider)
			changeTrackTintColor(@webSlider)
		end
	end

	def prepareForSegue(segue, sender:sender)    
    if (segue.identifier == 'Question3')            
      # surveyViewController3 = segue.destinationViewController
      # surveyViewController3.delegate = self  

      Survey.instance.answers[:q2] = {:cust => @custSlider.value, :web => @webSlider.value}   
    end
  end

  def custSliderChange(sender)
  	changeTrackTintColor(sender)
  end

  def webSliderChange(sender)
  	changeTrackTintColor(sender)
  end

  protected
  def changeTrackTintColor(sender)
  	case 
  	when sender.value < 0.5
  		sender.minimumTrackTintColor = UIColor.redColor
  	when sender.value == 0.5
  		sender.minimumTrackTintColor = UIColor.blueColor
  	when sender.value > 0.5
  		sender.minimumTrackTintColor = UIColor.greenColor
  	end
  end

end