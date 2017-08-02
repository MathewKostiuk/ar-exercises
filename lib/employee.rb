class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true

  before_create :random_password


  private
    def random_password
      self.password = (0...8).map { (65 + rand(26)).chr }.join
    end
end
