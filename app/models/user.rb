class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #ここにバリデーションを記載してもSQL文でデータが保存されるので、ストロングパラメータを利用する
  validates :password, confirmation: true
  validates :password, :password_confirmation, :name, :profile, :occupation, :position, presence: true
  has_many :prototypes
  has_many :comments

end
