class Phone < ApplicationRecord
  belongs_to :user

  KINDS = %w[mobile work home]
  validates :kind, inclusion: { in: KINDS }

  validate :user_cannot_have_more_than_three_phones, on: :create

  private

  def user_cannot_have_more_than_three_phones
    if user && user.phones.size >= 3
      errors.add(:base, "A user can have at most 3 phones")
    end
  end
end
