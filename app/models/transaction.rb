# encoding: utf-8
class Transaction
  include Mongoid::Document

  field :source_account_id, type: BSON::ObjectId
  field :destination_account_id, type: BSON::ObjectId
  field :amount, type: Float
  
  validates :source_account_id, :destination_account_id, :amount, presence: true
end
