module ApplicationHelper

    def delete_asset(link_text, path, confirm_text)
        link_to link_text, path, class: "btn", method: :delete, data: { confirm: confirm_text }
    end

end