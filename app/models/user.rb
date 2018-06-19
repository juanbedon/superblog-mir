# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :registerable, :rememberable, :trackable, :validatable

  has_many :posts

  validates_presence_of :name, on: :update
  validates_presence_of :email, on: :update

  def change_password(attrs)
  	update(password: attrs[:new_password], password_confirmation: attrs[:new_password_confirmation])
  end

  def gravatar_image_url
  	"https://www.gravatar.com/avatar/#{gravatar_hash}"
  end

  def display_name

    if name.present?
      name
    else
      "User"
    end
    
  end

  private

  def gravatar_hash
  	Digest::MD5.hexdigest(email.downcase)
  end

end