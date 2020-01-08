class User < ApplicationRecord
    PASSWORD_REGEX = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z])(?=.*[[:^alnum:]])/x
    validates :first_name, presence: true, length: {maximum: 30}, format: { with: /\A[a-zA-Z]+\z/, message: "kindly input only letters"}
    validates :last_name, presence: true, length: {maximum: 30}, format: { with: /\A[a-zA-Z]+\z/, message: "kindly input only letters"}
    validates :phone_number, presence: true, uniqueness:  { case_sensitive: false }, length: {in: 10..13}, numericality: {only_integer: true}
    validates :id_number, presence: true, uniqueness:  { case_sensitive: false }, length: {in: 7..9}, numericality: {only_integer: true}
    validates :password, presence: true, format: {with: PASSWORD_REGEX, message: "please input a stronger password"}, confirmation: true 
    validates :pin, numericality: {only_integer: true}, length: {is:4}
end
  
