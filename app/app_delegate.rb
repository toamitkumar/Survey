class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	Survey.instance
    $stdout.puts "#{App.name}"
    true
  end

  def window
    @window
  end
  
  def setWindow(new_window)
    @window = new_window
  end
end
