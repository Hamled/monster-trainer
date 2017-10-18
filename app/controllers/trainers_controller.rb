class TrainersController < ApplicationController
  before_action :find_trainer, only: [:show]

  def show
  end

  private

  def find_trainer
    @trainer = Trainer.find_by(id: params[:id])
  end
end
