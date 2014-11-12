class ShoppingList < ActiveRecord::Base
  serialize :integration_details

  belongs_to :user
  has_many :shopping_list_items

  before_save :set_integration_details

  validates_presence_of :title, :user

  def set_integration_details
    self.integration_details = {} unless integration_details
  end

  def save_in(integration)
    case integration.provider
      when 'trello'
        begin
          if integration_details['trello'].try(:[], 'checklist_id')
            remove_from(integration)
          end

          list_id = integration.details[:list_id]
          trello_integration = TrelloIntegration.new(user)
          card = trello_integration.client.create(:card, {'name' => title, 'idList' => list_id})
          checklist_response = card.create_new_checklist('Checklist')
          checklist_id = JSON.parse(checklist_response)['id']
          checklist = trello_integration.checklist(checklist_id)
          shopping_list_items.each do |item|
            checklist.add_item(item.title, item.done || false)
          end
          integration_details['trello'] = {card_id: card.id, checklist_id: checklist.id}
        rescue Trello::Error
        end
    end
    self.save
  end

  def remove_from(integration)
    case integration.provider
      when 'trello'
        begin
          card_id = integration_details['trello'].try(:[], :card_id)
          integration_details.delete('trello')

          trello_integration = TrelloIntegration.new(user)
          card = trello_integration.card(card_id)
          card.delete
        rescue Trello::Error
        end
    end
    self.save
  end

  def saved_in
    integration_details.keys
  end
end
