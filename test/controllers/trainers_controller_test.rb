require "test_helper"

describe TrainersController do
  describe "#show" do
    it "should respond with success" do
      get trainer_path(trainers(:misty))

      must_respond_with :success
    end
  end
end
