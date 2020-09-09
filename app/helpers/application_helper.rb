module ApplicationHelper
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      next if message.is_a?(TrueClass)
      concat (content_tag(:div, class: "modal fade", role: "dialog", tabindex: "-1", id: "myAlertModal", aria: {labelledby: "dialogo", hidden: "true"}) do
        concat (content_tag(:div, class: "modal-dialog", role: "document") do
          concat (content_tag(:div, class: "modal-content") do
            concat (content_tag(:div, class: "modal-body") do
              concat content_tag(:strong , message)
            end)
            concat (content_tag(:div, class: "modal-footer") do
              concat content_tag(:button, "Fechar", class: "btn btn-primary", data: { dismiss: 'modal' })
            end)
          end)
        end)
      end)
    end
    nil
  end
end
