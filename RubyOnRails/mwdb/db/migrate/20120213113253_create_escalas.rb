class CreateEscalas < ActiveRecord::Migration
  def change
    create_table :escalas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
