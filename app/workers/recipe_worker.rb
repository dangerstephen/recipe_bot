# Worker.rb
class RecipeWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def preform
    puts "Sidekiq Worker generating the recipe for the recipe at #{itemtoget}"
  end

end

# Recipes new

<div class="form-group">
    <%= text_field @item, class:"form-control",id:"rec-url", placeholder:"Recipe url" %>
</div>



<div id="wrapper">

<button class=" btn btn-primary generate-recipe">
  GENERATE Recipe
</button>

<div id="footer-javascripts">
  <script type="text/javascript">
    $("button.generate-recipe").on("click", function() {
      console.log("button is clicked");
      var dogs= $('#rec-url').val();
      window.location = "<%= recipes_report_url %>"
    })
  </script>
</div>


# Routes config
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
get "/recipes/report" => "recipes#report", as: "recipes_report"
