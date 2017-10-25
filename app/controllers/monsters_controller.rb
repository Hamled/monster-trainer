class MonstersController < ApplicationController
  def destroy
    monster = Monster.find_by(id: params[:id])
    monster.destroy

    flash["success"] = "Your monster has been released!"
    redirect_to root_path
  end
end
