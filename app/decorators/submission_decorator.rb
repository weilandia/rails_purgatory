class SubmissionDecorator < Draper::Decorator
  delegate_all

  def coderay_solution
    CodeRay::Duo[:ruby, :div].highlight(solution).html_safe
  end

  def user_nickname
    user.nickname
  end
end
