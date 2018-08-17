module ApplicationHelper
  def generate_token
    Link.generate_token
  end
end
