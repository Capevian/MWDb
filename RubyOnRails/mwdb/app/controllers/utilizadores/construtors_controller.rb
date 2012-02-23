class Utilizadores::ConstrutorsController < ApplicationController

  def index
    @titulo = "Construtores"
    @construtors = Construtor.paginate( :page => params[:page] ,:per_page => 10)
  end

  def show
  end

end
