class Contact < ApplicationRecord
	#before_save :downcase.email
	 validates :name , presence: true
	 validates :email , presence: true
  	 validates :message , presence: true , length: {maximum: 140}
end
