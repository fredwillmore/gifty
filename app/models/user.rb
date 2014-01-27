class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :merchants # , as: favorite
  belongs_to :merchants # , as: admin
  has_many :locations, as: :locatable, dependent: :destroy
  #has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, :reject_if => lambda { |a| a[:address].blank? }, allow_destroy: true

  def roles_display
    self.roles.map { |r| r.name }.join(", ")
  end

  def role_keys
    self.roles.map { |r| r.key }
  end
end
