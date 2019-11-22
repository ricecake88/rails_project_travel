module ApplicationHelper

    def self.destination(destination_id)
        Destination.find_by(:id => destination_id)
    end

    def self.attraction(object)
        Attraction.find_by(:id => object.attraction_id)
    end

    def flash_error_message(arg)
        "The form contains #{ActionController::Base.helpers.pluralize(arg.errors.count, 'error')}:<br> #{arg.errors.full_messages.join('<br> ')}"
    end

    def nav_link(link_text, link_path)
        class_name = current_page?(link_path) ? 'active' : ''

        content_tag(:li, :class => class_name) do
          link_to link_text, link_path
        end
    end

end
