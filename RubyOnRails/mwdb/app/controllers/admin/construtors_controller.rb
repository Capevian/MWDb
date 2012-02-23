class Admin::ConstrutorsController < ApplicationController

  def index
    @titulo = "Indice"
    @construtors = Construtor.paginate(:page => params[:page] , :per_page => 10)
  end

  def show
  end

  def new
    @title = "Novo Construtor"
    @construtor = Construtor.new
  end

  def create

    # Nota: é necessário criar o construtor em vários passos por causa do binário da imagem.
    @construtor = Construtor.new
    @construtor.nome = params[:construtor][:nome]
    @construtor.website = params[:construtor][:website]
    @construtor.image_file = params[:construtor][:logo]

    if @construtor.save
      flash[:success]="Construtor guardado com sucesso"
      redirect_to admin_path
    else
      flash[:error]="Falha a guardar o Construtor"
      redirect_to admin_path
    end

  end

  def edit
    @title = "Editar Construtor"
    @construtor = Construtor.find(params[:id])
  end

  def update

    #feito este assign complicado por causa do raio da foto...
    @construtor = Construtor.find(params[:id])

    @construtoraux = Construtor.new
    @construtoraux.nome = params[:construtor][:nome]
    @construtoraux.website = params[:construtor][:website]
    @construtoraux.image_file = params[:construtor][:logo]

    if @construtor.update_attributes(:nome => @construtoraux.nome ,
                                     :website =>@construtoraux.website,
                                     :logo => @construtoraux.logo )
       flash[:success]="Construtor actualizado com sucesso"
       redirect_to admin_construtors_path
    else
       flash[:error]="Falha a actualizar"
      redirect_to admin_construtors_path
    end
  end

  def destroy
    Construtor.find(params[:id]).destroy
    flash[:success] = "Construtor PUM!"
    redirect_to admin_construtors_path
  end



end
