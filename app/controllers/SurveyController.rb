class SurveyController < UINavigationController

  def begin_survey
    @questions = Survey.instance.questions
    pushViewController(createFormViewController("1"), animated: true)
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
          row.value = answer[option["key"]] if(was_answered?(answer, option["key"]))
        end
      end
    end

    form.build_section do |section|
      section.build_row do |row|
        row.title = last_question?(question_id) ? "Finish" : "Next" 
        row.type = "submit"
      end
    end

    form_controller = Formotion::FormController.alloc.initWithForm(form)
    last_question?(question_id) ? attacheOnFinishEvent : attachOnSubmitEvent(form_controller)
    form_controller.question_id = question_id
    form_controller
  end

  def attachOnSubmitEvent(view_controller) 
    view_controller.form.on_submit do |form|      
      Survey.instance.answers[view_controller.question_id] = form.render
      question_id = view_controller.question_id.to_i + 1
      pushViewController(createFormViewController(question_id.to_s), animated: true)
    end
  end

  def attacheOnFinishEvent
    
  end

  def last_question?(question_id)
    @questions.keys.size == question_id.to_i
  end

  def was_answered?(answer, key)
    answer and answer[key]
  end

end