class User < ApplicationRecord
  enum role: [:user, :customer, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :orders, dependent: :destroy

  # if user is deleted make sure to delete their orders too
  # has_many :orders, dependent: :destroy

end
