class PagesController < ApplicationController

  def home
    @title = "Home"

    @miniatura = Miniatura.first(:order => 'created_at DESC', :limit => 1)


  end

  def contacts
    @title = "Contactos"
  end

  def about
    @title = "Sobre Nos"
  end

end
