class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  before_destroy :check_for_bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  private 

  def check_for_bookmarks
    bookmarks.count == 0
  end
end
