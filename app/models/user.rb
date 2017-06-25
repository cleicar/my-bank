# encoding: utf-8
class User
  include Mongoid::Document

  ## User Info
  field :name, type: String
  field :registry, type: String
  field :email, type: String
  
  ## Relationships
  has_many :transactions
  has_one  :account

  ## Validations
  validates_uniqueness_of :registry
  validates :name, :registry, presence: true
end
