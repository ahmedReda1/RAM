class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  Roles = [ :admin , :default ]
  def is?( requested_role )
    self.role == requested_role.to_s
  end

  attr_accessor :country_code
  has_attached_file :avatar 
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
