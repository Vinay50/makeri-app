class Employee < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/sqlite3_adapter'

  belongs_to :company
  has_and_belongs_to_many :policies

  validates :name, presence: true
  validates :email, uniqueness: true

  acts_as_nested_set

  def self.employee_import(file,company_id)
    employees = []
    CSV.foreach(file.path, headers: true) do |row|
      binding.pry
      employees << Employee.new(row.to_h)
    end

    Employee.import employees, validate: true
  end
end
