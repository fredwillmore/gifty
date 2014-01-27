class Merchant < ActiveRecord::Base
  has_many :users # , as: admin
  has_and_belongs_to_many :users # , as: favorite
  has_many :locations, as: :locatable, dependent: :destroy
  accepts_nested_attributes_for :locations, :reject_if => lambda { |a| a[:address].blank? }, allow_destroy: true
#  has_many :merchant_types, :dependent => :destroy
#  serialize :merchant_type_ids, ActiveRecord::Coders::Hstore
#  serialize :merchant_type_ids

  def merchant_types
    MerchantType.find merchant_type_ids
  end
end
