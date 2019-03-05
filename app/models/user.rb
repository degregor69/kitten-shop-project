class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart

  # Création du cart associé à l'utilisateur en même temps que l'inscription
  after_create do 
    id = User.all.last.id
    Cart.create!(user_id: id)
  end

  has_many :orders
  has_many :items, through: :orders
<<<<<<< HEAD
=======

  has_one_attached :avatar
>>>>>>> delivery-laurane-active-storage
end

