require 'faraday'
require 'json'

module Ripple
  class Jack
    @@ripple_rest = 'https://api.ripple.com'

    def initialize hash=nil
      @last_hash = hash
    end
  
    def self.account account
      @@account = account
    end

    def self.ripple_rest url
      @@ripple_rest = url
    end

    def self.destination_tag tag
      @@destination_tag = tag
    end

    def self.currency currency
      @@currency = currency
    end

    def self.issuer issuer
      @@issuer = issuer
    end

    def start hash
      @last_hash = hash
      if notification = get_next_notification
        
        on_payment notification
      else
        sleep 1 
        start hash 
      end
    end

    def continue
    end

  private

    def get_next_notification
      url = get_notification(@last_hash)['next_notification_url']
      if url.length > 0
        puts "get next url #{url}"
        notification = JSON.parse(Faraday.get("https://#{url}").body)['notification']

        if notification['type'] == 'payment'
          on_payment notification
        end
        @last_hash = notification['hash']
        get_next_notification
      else 
        sleep 1
        get_next_notification
      end
    end

    def get_notification hash
      url = "#{@@ripple_rest}/v1/accounts/#{@@account}/notifications/#{hash}"
      JSON.parse(Faraday.get(url).body)['notification']
    end

    def get_payment
    end

    def on_payment payment
    end

    def save_hash hash
      @last_hash = hash 
    end
  end
end


