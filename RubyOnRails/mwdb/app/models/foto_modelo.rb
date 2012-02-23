class FotoModelo < ActiveRecord::Base

  attr_accessible :foto , :modelo_id

  #validates :foto , :presence => true

  belongs_to :modelo

  def image_file=(input)
    self.foto = input.read
  end

end
