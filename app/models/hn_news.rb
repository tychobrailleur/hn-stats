class HnNews
  def self.latest
    Rails.logger.info("Retrieving latest info...")
    HnApi::Client.new.latest.items
  end
end
