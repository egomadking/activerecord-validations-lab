class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbaity?

  def is_clickbaity?
    keywords = /won't believe|secret|top\s*\d+|guess/i
    unless keywords.match title
      errors.add(:title, "must be clickbait")
    end
  end

end


