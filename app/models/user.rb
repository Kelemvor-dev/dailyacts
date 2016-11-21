class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :rememberable

  belongs_to :user

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_attached_file :image,   
  :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => {       
    :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"},      
    :unique_filename => true   
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :portada,   
  :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => {       
    :path => proc { |style| "#{style}/#{id}_#{portada.original_filename}"},      
    :unique_filename => true   
  }
  validates_attachment_content_type :portada, content_type: /\Aimage\/.*\Z/

  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end

  def email_required?
    false
  end

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
  
  validates :username, presence: true, uniqueness: true, length: {in: 5..20, too_short: "Minimo 5 caracteres", too_long: "Maximo 20 caracteres"},
  format: {with: /([A-Za-z0-9\-\_]+)/, message: "El nombre de usuario solo puede contener letras, numeros y guiones"}

   private

end
