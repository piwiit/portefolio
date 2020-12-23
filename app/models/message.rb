class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :body
  validates :name, :email, :body, presence: true
  validates_format_of :email,
                      with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/,
                      message: 'Veuillez entrer une adresse email valide.'
  validates :body, presence: { message: "Tu as oublié d'écrire ton message !" }
end
