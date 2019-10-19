module Pages
  module Transactions
    class Index < SitePrism::Page
      set_url '/'

      element :file_input, "input[type=file]"
      element :submit, "button[type=submit]"
      element :modal_completed, '#modal-completed'
      element :modal_failed, '#modal-failed'

      elements :store_cards, 'div.card'
    end
  end
end
