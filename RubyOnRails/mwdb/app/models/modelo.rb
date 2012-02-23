class Modelo < ActiveRecord::Base

  attr_accessible :nome, :ano , :website , :thumb , :marca_id

  validates :nome, :presence => true
  validates :ano , :presence => true
  validates :marca_id , :presence => true

  belongs_to :marca

  has_many :foto_modelos

  has_many :miniaturas

  def image_file=(input)
    self.thumb = input.read
  end

end
