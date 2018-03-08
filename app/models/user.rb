class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :portfolios, dependent: :destroy
  has_many :stocks, through: :portfolios
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
