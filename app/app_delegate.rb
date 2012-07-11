class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @navigation_controller = UINavigationController.alloc.init

  	@questions = Survey.instance.questions
    $stdout.puts "#{App.name}"

    @navigation_controller.pushViewController(createFormViewController("1"), animated: true)

    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible
    true
  end

  def createFormViewController(question_id)
    question = @questions[question_id]
    answer = Survey.instance.answers[question_id]
    form = Formotion::Form.new

    form.build_section do |section|
      section.title = question["q"]

      case question["type"]
      when "check"
        section.select_one = true
        section.key = question["key"]
      end

      question["op"].each do |option|
        section.build_row do |row|
          row.key = option["key"]
          row.title = option["value"]
          row.type = question["type"]
          row.items = option["items"] if(%W(control ui_picker).include?(question["type"]))
          row.value = answer[option["key"]] if(answer and answer[option["key"]])
        end
      end
    end

    form.build_section do |section|
      section.build_row do |row|
        row.title = "Next"
        row.type = "submit"
      end
    end

    form_controller = Formotion::FormController.alloc.initWithForm(form)
    attachOnSubmitEvent(form_controller)
    form_controller.question_id = question_id
    form_controller
  end

  def attachOnSubmitEvent(view_controller) 
    view_controller.form.on_submit do |form|      
      Survey.instance.answers[view_controller.question_id] = form.render
      question_id = view_controller.question_id.to_i + 1
      @navigation_controller.pushViewController(createFormViewController(question_id.to_s), animated: true)
    end
  end

end
