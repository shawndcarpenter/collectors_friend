namespace :csv_load do
  desc "TODO"
  task issues: :environment do
    require "csv"
    collection = Collection.new(name: "Magazine")
    csv_text = File.read(Rails.root.join('db', 'data', 'dw_magazine.csv'))
    csv = CSV.parse(csv_text, headers:true)
    csv.each do |row|
      issue = collection.issues.new
      issue.collector_id = row['No']
      issue.status = row['Have']
      issue.title = row['Title']
      issue.date = row['Year']
      issue.save
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('issues')
  end
  puts "issues seeded"
end