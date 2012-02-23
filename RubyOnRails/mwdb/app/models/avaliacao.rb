class Avaliacao < ActiveRecord::Base

  attr_accessible :avaliacao, :user_id ,:miniatura_id

  belongs_to :user
  belongs_to :miniatura

end
