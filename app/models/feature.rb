class Feature < ApplicationRecord
  has_many :issue_features
  has_many :issues, through: :issue_features
end
