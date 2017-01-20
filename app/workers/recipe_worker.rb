class RecipeWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def preform
    puts "Sidekiq Worker generating the recipe for the recipe at #{itemtoget}"
  end

end
