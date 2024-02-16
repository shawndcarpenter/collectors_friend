class Issue < ApplicationRecord
  has_many :issue_features
  has_many :features, through: :issue_features
  belongs_to :collection

  enum status: {
    do_not_have: 0,
    ordered: 1,
    have: 2
  }
end
