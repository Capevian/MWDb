class CreateConstrutors < ActiveRecord::Migration
  def change
    create_table :construtors , :force => true do |t|
      t.string :nome
      #t.binary :logo , :limit => 2.megabyte
      #t.column :logo, :binary, :limit => 2.megabyte
      t.string :website

      t.timestamps
    end

    execute 'ALTER TABLE construtors ADD COLUMN logo LONGBLOB'
  end
end
