class UserDesignation < ApplicationRecord
  belongs_to :designation
  belongs_to :department
  belongs_to :user
end
