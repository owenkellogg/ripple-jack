# Ripple Jack Ruby

Plug in to Ripple accounts

## Usage

````
require 'ripple-jack'

class MyJack < Ripple::Jack
  account 'r4EwBWxrx5HxYRyisfGzMto3AT8FZiYdWk'
  ripple_rest 'https://api.ripple.com'

  def on_payment payment
    puts "Look I transacted! #{payment}"
  end
end

jack = MyJack.new

LAST_TRANSASCTION_HASH = '9F202D6779FC86BE40393F4DBB3B1C206EE06EB1785F5ACDC4319DD373EC0FAE'

jack.start LAST_TRANSACTION_HASH
````

