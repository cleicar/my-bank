# encoding: utf-8
class Transaction
  include Mongoid::Document

  field :source_account_id, type: String
  field :destination_account_id, type: String
  field :amount, type: Float
  field :date, type: Date

  # has_one: :account, 
  # has_one: :account
  
  validates :source_account_id, :destination_account_id, :amount, presence: true
end
