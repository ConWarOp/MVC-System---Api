class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.search(search)
        if search
              User.where('email LIKE ?',"%#{search}%")
        else
              User.all
        end
    end

 has_many :friendships
 has_many :friends, :through => :friendships
 has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
 has_many :inverse_friends, :through => :inverse_friendships, :source => :user
 has_many :posts, dependent: :destroy
 has_many :messages, class_name: 'Message'
 has_many  :conversations, foreign_key: :sender_id, class_name: 'Conversation'
end
