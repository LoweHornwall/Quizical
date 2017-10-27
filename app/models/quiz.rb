class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes[:description].blank? }, allow_destroy: true
  validates :questions, :length => { :maximum => 5}

  validates :name, :category, presence: true
  validates :name, uniqueness: true
  # validates that the inputted category is one of the selectable ones.
  validates :category, :inclusion => { :in => ['Games', 'Sports', 'Music'], :message => "%{value} is not a valid category"}
end
