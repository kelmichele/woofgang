class Reporter < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :outlet, presence: true
  validates :question, presence: true

  # def self.to_csv(options = {})
  #   desired_columns = ["id", "first_name", "last_name", "email", "phone", "outlet", "question", "created_at"]
  #   CSV.generate(options) do |csv|
  #     csv << desired_columns
  #     all.each do |reporter|
  #       csv << reporter.attributes.values_at(*desired_columns)
  #     end
  #   end
  # end
end
