class Link < ActiveRecord::Base
  validates :token, presence: true
  validates :url, presence: true
end
