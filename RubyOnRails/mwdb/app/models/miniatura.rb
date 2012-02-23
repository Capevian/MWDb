class Miniatura < ActiveRecord::Base

  attr_accessible :descricao,:thumb,:modelo_id,:construtor_id,:escala_id

  validates :descricao , :presence => true

  default_scope :order => 'miniaturas.created_at DESC'


  belongs_to :modelo
  belongs_to :escala
  belongs_to :construtor

  #Fizeste-a bonita com as "miniaturases"...Live with it now...
  has_many :foto_miniaturas , :dependent => :destroy
  has_many :comentarios , :dependent => :destroy
  has_many :avaliacaos   , :dependent => :destroy

  def image_file=(input)
    self.thumb = input.read
  end

  def extract_construtor
    @construtor = Construtor.find_by_id(self.construtor_id)
    return @construtor.nome
  end

  def extract_escala
    @escala = Escala.find_by_id(self.escala_id)
    return @escala.descricao
  end

end
