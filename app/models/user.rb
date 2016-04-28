class User < ActiveRecord::Base
  has_one :studentapplication
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :email, :presence => true, :email => true

end