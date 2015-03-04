class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :mechanics, class_name: "Mechanic", :dependent => :destroy
  has_many :comments, class_name: "Comment", :dependent => :destroy
  has_many :roles, class_name: "UserRole", :dependent => :destroy
  has_many :recently_visited, class_name: "RecentlyVisited", :dependent => :destroy

end
