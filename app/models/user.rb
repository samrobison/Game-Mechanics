class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mechanics, class_name: "Mechanic", :dependent => :destroy
  has_many :comments, class_name: "Comment", :dependent => :destroy
  has_many :userRole, class_name: "UserRole", :dependent => :destroy

end
