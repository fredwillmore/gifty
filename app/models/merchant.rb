class Merchant < ActiveRecord::Base
  has_many :users # , as: admin
  has_and_belongs_to_many :users # , as: favorite
end
