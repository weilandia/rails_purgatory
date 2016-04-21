class WebhookFileChange
  attr_reader :filename, :encoded_contents, :contents, :additions
  def initialize(file, service, commit_sha)
    @sha = commit_sha
    @filename = file[:filename]
    @encoded_contents = service.get_file_contents(@filename, @sha)[:content]
    @contents = Base64.decode64(@encoded_contents)
    @additions = file[:additions]
  end

  def parse_solution_name
    if !filename.include?("spec")
      filename.split("/").last.gsub(".rb", "")
    end
  end
end
