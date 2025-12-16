class User < ApplicationRecord
  # 保存直前にメールアドレスを小文字に変換
  before_save { self.email = email.downcase } 

  # 名前とメールアドレスのバリデーション
  validates :name,  presence: true, length: { maximum: 50 }

  # メールアドレスの正規表現（ドット連続防止版）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    # 小文字化しているため、uniquenessはtrueでOK
                    uniqueness: true 

  # パスワード機能の有効化
  has_secure_password 
  
  # パスワードのバリデーション
  validates :password, presence: true, length: { minimum: 6 } 
end