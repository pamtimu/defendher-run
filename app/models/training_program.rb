class TrainingProgram < ApplicationRecord
  belongs_to :user
  def set_content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "I have a race on the #{@coach.duration} for a #{@coach.distance} race. Please give me a running training program. Give me only the text of the recipe, without any of your own answer like 'Here is a running program'."}]
    })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: new_content)
    return new_content
  end
end
