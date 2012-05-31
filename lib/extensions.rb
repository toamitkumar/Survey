module Extensions

	def changeNavigationBarBackButtonText
		backButton = UIBarButtonItem.alloc.initWithTitle("Back", 
																			style:UIBarButtonItemStylePlain, 
																			target:nil, 
																			action:nil)
		self.navigationItem.backBarButtonItem = backButton
	end

end