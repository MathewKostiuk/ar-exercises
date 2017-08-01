class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :either_men_or_womens_apparel
  has_many :employees

  def either_men_or_womens_apparel
    if mens_apparel.blank? && womens_apparel.blank?
      errors.add(:mens_apparel, 'Sell some sort of clothing, please')
    end
  end
end



  # * BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)