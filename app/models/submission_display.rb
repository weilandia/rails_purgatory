class SubmissionDisplay
  attr_reader :solution, :comments, :user
  def initialize(submission)
    @solution = CodeRay::Duo[:ruby, :div].highlight(submission.solution)
    @comments = submission.comments
    @user = submission.user.nickname
  end
end
