class User < ActiveRecord::Base
  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # role_base system
  has_and_belongs_to_many :roles
  attr_accessible :role_ids

  def roles_include(role) 
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  private
  def set_default_role
    self.roles << Role.find_by_name("Guest")
  end

end
