class AddUsernameUniquenessToUsers < ActiveRecord::Migration

  #Cria um index nos usernames E cria uniqueness .Também melhora a velocidade das pesquisas

  def change
    add_index :users, :username , :unique => true
  end
end
