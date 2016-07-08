require "http/client"
require "json"

class Rayons
  BASE_URL = "https://rayons.info"

  def get_random_item
    Item.from_json(get("/items/random.json"))
  end

  class Item
    JSON.mapping(
      id: Int32,
      title: String,
      artist: String,
      year: Int32,
      label: String,
      format: String,
      condition: String,
      price_paid: String,
      created_at: {type: Time, converter: Time::Format::ISO_8601_DATE},
      color: String
    )

    def url
      "#{Rayons::BASE_URL}/items/#{id}"
    end
  end

  private def get(path)
    response = HTTP::Client.get("#{BASE_URL}#{path}")
    if response.success?
      response.body
    else
      raise "(#{response.status_code}): #{response.body}"
    end
  end
end
