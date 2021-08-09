class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cocktails, :dependent => :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :registerable, :confirmable
end
