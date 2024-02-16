require 'csv'
class Issue < ApplicationRecord
  has_many :issue_features
  has_many :features, through: :issue_features
  belongs_to :collection

  enum status: {
    do_not_have: 0,
    ordered: 1,
    have: 2
  }

  def incomplete?
    title == nil
  end

  def missing
    where(status: ["do_not_have", nil])
  end

  def ebay_search
    formatted_title = title.parameterize(separator: '+')
    "https://www.ebay.com/sch/i.html?_from=R40&_nkw=#{formatted_title}&_sacat=0"
  end

  def self.to_csv
    attributes = %w{id title}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      Issue.all.each do |issue|
        csv << attributes.map{ |attr| issue.send(attr) }
      end
    end
  end
end
