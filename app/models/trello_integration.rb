class TrelloIntegration
  attr_accessor :client, :user, :member, :boards

  def initialize(user)
    @user = user
  end

  def client
    provider = @user.providers.where(provider: 'trello').first
    return unless provider
    return @client if @client
    @client = Trello::Client.new(
      consumer_key: Settings.trello.key,
      consumer_secret: Settings.trello.secret,
      oauth_token: provider.token,
      oauth_token_secret: provider.secret
    )
  end

  def member
    return @member if @member
    @member = client.find(:members, @user.email)
  end

  def boards
    return @boards if @boards
    @boards = member.boards
  end

  def lists(board_id)
    board = client.find(:boards, board_id)
    board.lists
  end

  def list(id)
    client.find(:lists, id)
  end

  def card(id)
    client.find(:cards, id)
  end

  def checklist(id)
    client.find(:checklists, id)
  end
end
