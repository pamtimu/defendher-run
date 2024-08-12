class CoachesController < ApplicationController
 before_action :find_coach, only: [:show]
  def index
    @coaches = Coach.all
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.create!(coach_params)
    redirect_to coach_path(@coach)
  end

  def show
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "I have a race on the #{@coach.duration} for a #{@coach.distance} race. Please give me a running training program. Give me only the text of the recipe, without any of your own answer like 'Here is a running program'."}]
    })
    @program = chaptgpt_response["choices"][0]["message"]["content"]
  end


 private

 def find_coach
    @coach = Coach.find(params[:id])
 end

  def coach_params
    params.require(:coach).permit(:duration, :distance)
  end

end
