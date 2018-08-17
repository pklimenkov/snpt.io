class Link < ActiveRecord::Base
  validates :token, presence: true
  validates :url, presence: true

  def self.generate_token
    token = nil

    loop do
      token = SecureRandom.urlsafe_base64(10)
      break if where(token: token).none?
    end

    token
  end
end
