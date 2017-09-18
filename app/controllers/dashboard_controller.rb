class DashboardController < ApplicationController

  def index
    @tweet_info = build_twitter_service
    if current_user.favorite_player
      raw_data = build_mysportsfeeds_service.data
      @favorite_player_stats = FavPlayerStats.new(raw_data)
    end
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

  def build_mysportsfeeds_service
    @sports_feeds_service ||= MySportsFeedsService.new(current_user.favorite_player.full_name)
  end

end
