module Praxis
  module Extensions

    module Rendering
      extend ActiveSupport::Concern
      include FieldExpansion

      def render(object, include_nil: false)
        loaded = self.media_type.load(object)
        renderer = Praxis::Renderer.new(include_nil: include_nil)
        renderer.render(loaded, self.expanded_fields)
      end

      def display(object, include_nil: false)
        response.headers['Content-Type'] = self.media_type.identifier
        response.body = render(object, include_nil: include_nil)
        response
      end
    end
  end
end
