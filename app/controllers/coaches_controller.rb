class CoachesController < ApplicationController
 before_action :find_coach, only: [:show, :save_program]
  def index
    @coaches = current_user.coaches.where.not(program_content: [nil, ''])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = current_user.coaches.new(coach_params)

    if @coach.save
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "I have a race on the #{@coach.duration} for a #{@coach.distance} race. Please give me a running training program. Give me only the text of the program, without any of your own answer like 'Here is a running program'."}]
      })

      @program = chaptgpt_response["choices"][0]["message"]["content"]
      redirect_to @coach
    else
      render :new
    end
  end

  def show
    @program = @coach.program_content
    if @program.blank?
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "I have a race on the #{@coach.duration} for a #{@coach.distance} race. Please give me a running training program. Give me only the text of the program, without any of your own answer like 'Here is a running program'."}]
      })
      @program = chaptgpt_response["choices"][0]["message"]["content"]
    end
  end

  def save_program
    if @coach.program_content.blank? && @coach.user == current_user
      @coach.update(program_content: params[:program_content])
      redirect_to coaches_path, notice: 'Training program saved successfully.'
    else
      redirect_to @coach, alert: 'This program is already saved.'
    end
  end

 private

 def find_coach
    @coach = Coach.find(params[:id])
 end

  def coach_params
    params.require(:coach).permit(:duration, :distance, :name)
  end

end
