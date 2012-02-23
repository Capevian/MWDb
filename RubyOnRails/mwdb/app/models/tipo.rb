class Tipo < ActiveRecord::Base

  #Criar gets e sets, permitir acessos
  attr_accessible :descricao, :thumb

  validates :descricao , :presence => true

  has_many :marcas


  #Esta função extrai o conteudo de um ficheiro que venha do sistema,
  #uma vez que o que vem para além da foto tem mais cenas
  def image_file=(input)
    self.thumb = input.read
  end

end
