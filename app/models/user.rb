class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :favorite_merchants, class_name: "Merchant"
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

  #def favorite_merchants
  #  @user = User.find params[:id]
  #  Merchant.find @user.favorite_merchant_ids
  #end

  # set current user for use in models by User.current
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  #######################################################
  #            begin - search support methods           #
  #######################################################

  include PgSearch

  pg_search_scope :search_name, :against => [:first_name, :last_name],
                  :using => {
                      :tsearch => {:prefix => true}
                  }

#                  :using => [:tsearch, :dmetaphone, :trigrams],
#                  :ignoring => :accents

                  #:associated_against => {
                  #    :translations => [:title, :description],
                  #    :extracted_assets => :plain_text
                  #}
end
