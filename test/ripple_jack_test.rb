require './lib/ripple_jack.rb'

class StevenJack < Ripple::Jack
  account 'r4EwBWxrx5HxYRyisfGzMto3AT8FZiYdWk'
  ripple_rest 'https://api.ripple.com'

  def on_payment payment
    puts "Look I transacted! #{payment}"
  end
end

jack = StevenJack.new

jack.start '9F202D6779FC86BE40393F4DBB3B1C206EE06EB1785F5ACDC4319DD373EC0FAE'

