class Construtor < ActiveRecord::Base


  #Criador de gets e sets, permitem atribuições
  attr_accessible :nome, :logo ,:website

  has_many :miniaturas


  #Validações, força a presençar
  #validates :nome , :presence => true


  def image_file=(input)
    self.logo = input.read
  end


end
