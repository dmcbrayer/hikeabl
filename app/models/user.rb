class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default_user.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true


  has_many :trips
end

#Notes on how to set up the structure of this

#The trips model should has_many :pieces and the :piece model should automatically 
#contain all of the suggested equipment that someone should bring on a hike.  The
#:trips edit and new actions should bring up a checkbox form where the user can select
#which things they brought on their trip.  The show action should display the things
#that were packed as a ul.  

#later on, the things model should have an attached image for each thing and the image
#should act as a checkbox to have better user functionality.
