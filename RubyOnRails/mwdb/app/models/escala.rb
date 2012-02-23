class Escala < ActiveRecord::Base

  #Permite aceder às escalas e fazer get e set das mesmas.
  attr_accessible :descricao


  validates :descricao , :presence => true

  has_many :miniaturas

end
