class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def phone_number_display
    n = phone_number.to_s
    "(#{n[0..2]}) #{n[3..5]}-#{n[6..9]}"
  end
end
