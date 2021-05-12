class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}\z/i }
  validates :nickname, presence: true
  validates :family_name, presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :family_name_kana, presence: true, format:{ with: /\A[ァ-ヶ一]+\z/}
  validates :first_name_kana, presence: true, format:{ with: /\A[ァ-ヶ一]+\z/}
  validates :birthday, presence: true
end
