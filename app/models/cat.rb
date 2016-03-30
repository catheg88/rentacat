class Cat < ActiveRecord::Base
  COLORS = %w(black white grey orange brown red)
  validates :birth_date, :name, :sex, :color, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests,
  :dependent => :destroy

  def age
    @age = Date.today - self.birth_date
    @age
  end

  def colors
    COLORS
  end
end
