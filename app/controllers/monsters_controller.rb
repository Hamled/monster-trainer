class MonstersController < ApplicationController
  def destroy
    if !logged_in?
      flash["error"] = "You must be logged in to do that"
      return redirect_to root_path
    end

    monster = Monster.find_by(id: params[:id])
    if !monster.captured?
      flash["error"] = "You can't release a wild monster"
      return redirect_to root_path
    end

    monster.destroy

    flash["success"] = "Your monster has been released!"
    redirect_to root_path
  end
end
