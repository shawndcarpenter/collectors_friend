class IssueFeature < ApplicationRecord
  belongs_to :issue
  belongs_to :feature
end
