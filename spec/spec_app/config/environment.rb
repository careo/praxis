Praxis::Application.configure do |application|
  application.layout do
    layout do
      map :initializers, 'config/initializers/**/*'
      map :design, 'design/' do
        map :api, 'api.rb'
        map :media_types, '**/media_types/**/*'
        map :resources, '**/resources/**/*'        
      end
      map :app, 'app/' do
        map :models, 'models/**/*'
        map :controllers, '**/controllers/**/*'
        map :responses, '**/responses/**/*'
      end
    end
  end
end
