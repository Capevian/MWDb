class Comentario < ActiveRecord::Base

  attr_accessible :texto, :publicado , :user_id ,:miniatura_id

  validates :texto , :presence => true

end
