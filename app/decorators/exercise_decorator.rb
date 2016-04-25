class ExerciseDecorator < Draper::Decorator
  delegate_all

  def create_div(current_user)
    if needs_tutorial?(current_user)
      exercise_div(tutorial_link(current_user))
    elsif tutorial?
      # exercise_div(docs_link)
    elsif done?(current_user)
      exercise_div(done_link(current_user))
    elsif current?(current_user)
      exercise_div(current_link(current_user))
    elsif new?(current_user)
      exercise_div(new_link(current_user))
    else
      exercise_div(locked_link)
    end
  end

  def exercise_div(content)
    h.content_tag(:div, content, class:"exercise-div col-xs-6 col-sm-4 col-md-3")
  end

  def needs_tutorial?(current_user)
    level == 0  && current_user.level == 0
  end

  def new?(current_user)
    current_user.level == exercise.level
  end

  def current?(current_user)
    current_user.exercises.pluck(:level).include?(level)
  end

  def tutorial?
    level == 0
  end

  def done?(current_user)
    current_user.level > exercise.level && current_user.completed_exercise?(exercise.id)
  end

  def tutorial_link(current_user)
    h.link_to(name, "", class:"exercise tutorial", "data-toggle" => "modal", 'data-target' => '#tutorialModal', "data-user" => current_user.nickname)
  end

  def docs_link
    h.link_to("purgatory docs", h.docs_path, class:"exercise done")
  end

  def done_link(current_user)
    h.link_to(name, h.user_exercise_path(current_user.nickname, id), class:"exercise done")
  end

  def new_link(current_user)
    h.link_to(name, "", class:"exercise new", "data-toggle" => "modal", "data-target" => "#nextExerciseModal", "data-exercise" => name, "data-user" => current_user.nickname)
  end

  def current_link(current_user)
    h.link_to(name, "", class:"exercise current", "data-toggle" => "modal", "data-target" => "#currentExerciseModal", "data-exercise" => name, "data-user" => current_user.nickname)
  end

  def locked_link
    h.link_to(name, "#", class:"exercise locked", disabled: true)
  end
end
