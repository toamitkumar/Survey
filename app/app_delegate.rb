class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @navigation_controller = UINavigationController.alloc.init

  	$stdout.puts "#{App.name}"

    @navigation_controller = SurveyController.alloc.initWithRootViewController(create_view_controller)

    # @questions = Survey.instance.questions
    # @navigation_controller.pushViewController(createFormViewController("1"), animated: true)

    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible
    true
  end

  def create_view_controller
    form = Formotion::Form.new

    form.build_section do |section|
      section.title = "Welcome to XYZ Survey Platform !"
      section.build_row do |row|
        row.title = "Start Survey"
        row.type = "submit"
      end
    end
    form_controller = Formotion::FormController.alloc.initWithForm(form)

    form_controller.form.on_submit do |form|      
      @navigation_controller.begin_survey
    end

    form_controller
  end
end
