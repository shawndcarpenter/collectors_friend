class Issue < ApplicationRecord
  has_many :issue_features
  has_many :features, through: :issue_features
  belongs_to :collection
end
