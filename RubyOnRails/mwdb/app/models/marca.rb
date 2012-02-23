class Marca < ActiveRecord::Base

  attr_accessible :nome, :logo , :tipo_id


  validates :tipo_id , :presence => true

  belongs_to :tipo

  has_many :modelos


  def image_file=(input)
    self.logo = input.read
  end

end
