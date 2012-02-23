class FotoMiniatura < ActiveRecord::Base

  attr_accessible :foto, :miniatura_id

  validates :foto , :presence => true

  belongs_to :miniatura

  def image_file=(input)
    self.thumb = input.read
  end

end
