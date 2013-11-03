class Merchant < ActiveRecord::Base
  has_many :users # , as: admin
  has_and_belongs_to_many :users # , as: favorite
  has_many :locations, :dependent => :destroy
  accepts_nested_attributes_for :locations, :reject_if => lambda { |a| a[:address].blank? }, allow_destroy: true
end
