class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :either_men_or_womens_apparel
  has_many :employees

  before_destroy :dont_destroy_if

  def either_men_or_womens_apparel
    if mens_apparel.blank? && womens_apparel.blank?
      errors.add(:mens_apparel, 'Sell some sort of clothing, please')
    end
  end

  private
  def dont_destroy_if
    if !self.has_attribute?(:employees)
      return true
    end
    unless employees.nil?
      self.errors[:base] << "Cannot delete while employees are still in the building"
      throw:abort
    end
  end
end
