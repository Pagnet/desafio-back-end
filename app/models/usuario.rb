class Usuario < ApplicationRecord
	has_secure_password

  validates :nome, presence: true, length: {maximum: 25} 
  validates :cpf, presence: true, length: {is: 14}, uniqueness: {case_sensitive: false}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 50}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  validates :celular, presence: true, length: {is: 14}, uniqueness: {case_sensitive: false}
  validates :user, presence: true, length: {in: 6..20}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
end
