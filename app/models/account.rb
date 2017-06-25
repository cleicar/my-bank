# encoding: utf-8
class Account
  include Mongoid::Document

  field :account_code, type: BSON::ObjectId
  field :balance, type: Float

  validates :account_code, :balance, presence: true

  belongs_to :user
end
