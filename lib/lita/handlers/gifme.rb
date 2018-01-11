module Lita
  module Handlers
    class Gifme < Handler
      # insert handler code here

      config :api_key, type: String, required: true

      route %r{^gifme\s+(.+)}i, :gifme, command: true, help: { "gifme" => "Gets a random gif back from giphy.com" }

      def gifme(response)

        search = response.matches[0][0]
        search.gsub!(' ', '+')

        giphy_response = http.get("http://api.giphy.com/v1/gifs/search?q=#{search}&api_key=#{config.api_key}")

        images = MultiJson.load(giphy_response.body)
        
        if images['data'] == []
          
          response.reply("No search responses for #{search}")
          
        else

          response.reply(images['data'].sample['images']['original']['url'])
          
        end

      rescue => e

        response.reply "Something went wrong! #{e} BLargh!"

      end

      Lita.register_handler(Gifme)
    end
  end
end
