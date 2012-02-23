class AddAdminToUsers < ActiveRecord::Migration

  #Esta migração serve para criar o Deus desta aplicação - Admin!
  def change
    user = User.new(:username => "Capevian",:email =>"admin@capevian.pt",:password => "adminmwdb")
    user.admin = 1
    user.save
  end
end
