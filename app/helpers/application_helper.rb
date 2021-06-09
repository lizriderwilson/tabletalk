module ApplicationHelper

    def display_delete_asset_link(link_text, path, css_class, confirm_text)
        link_to link_text, path, method: :delete, class: css_class, data: { confirm: confirm_text }
    end

end