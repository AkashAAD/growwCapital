class Employer < ApplicationRecord
  validates_uniqueness_of :name
  scope :search_employer, ->(text) { where("name LIKE ?", "%#{text}%") }

  def self.add_employers
    require 'csv'
    file = File.join(Rails.root, 'CompanyList.csv')
    file = File.read(file)
    csv = CSV.parse(file, :headers => true)
    employer = self.new(name: 'AMITY University')
    employer.save
    csv.each do |row|
      employer = self.new(name: row[1])
      employer.save
      puts row[1]
    end
  end

end
