class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  # validates :overlapping_approved_requests

  belongs_to :cat

  # CatRentalRequest.find_by_cat_id

  # def overlapping_requests(request2)
  #   s1, e1 = self.start_date, self.end_date
  #   s2, e2 = request2.start_date, request2.end_date
  #
  #   s2 < e1 && s1 < s2 || s2 < s1 && s1 < e2
  # end
  #
  # def overlapping_approved_requests(request2)
  #   errors << "no no no" if self.overlapping_requests(request2) &&
  #     (self.status == APPROVED || request2.status == APPROVED)
  # end
end
