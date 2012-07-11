class SurveyViewController1 < UITableViewController
	include Extensions

	attr_accessor :selected_index, :options

	def viewDidLoad
		super
    NSLog("-------------------------------------------")
    @options = Survey.instance.questions["1"]
    puts @options.inspect
		# changeNavigationBarBackButtonText
	end

	def tableView(tableView, numberOfRowsInSection:secton)
    @options.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
  	cell = tableView.dequeueReusableCellWithIdentifier("radioCell")    
    cell.nameLabel.text = @options[indexPath.row]    
    cell
  end

	def tableView(tableView, didSelectRowAtIndexPath:indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated:true)

		if(@selected_index)
			path = NSIndexPath.indexPathForRow(@selected_index, inSection:0)
			cell = tableView.cellForRowAtIndexPath(path)
			cell.accessoryType = UITableViewCellAccessoryNone
		end

		@selected_index = indexPath.row
		cell = tableView.cellForRowAtIndexPath(indexPath)
		cell.accessoryType = UITableViewCellAccessoryCheckmark
		# self.delegate.didSelectGame(self, @game)
	end

	def prepareForSegue(segue, sender:sender)    
    if (segue.identifier == 'Question2')            
      surveyViewController2 = segue.destinationViewController
      surveyViewController2.delegate = self

      Survey.instance.answers[:q1] = @selected_index
    end
  end

  def goToHome(sender)
  	NSLog("Pushing the log to the logfile")
  	NSLog(sender.inspect)
  	self.navigationController.popViewControllerAnimated(true)
  end


end