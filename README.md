AKaynak is a class for getting currency data from www.altinkaynak.com webService. Which is public and free to use.

```ruby
 require 'akaynak.rb'

 AKaynak.configure do |config|
 	config.usercode = 'AltinkaynakWebServis'
 	config.password = 'AltinkaynakWebServis'
 end
 
 result = AKaynak::Data.get_currency()
 puts result.inspect
 
 puts result[:result]["Kurlar"]["Kur"]
 puts result[:result]["Kurlar"]["Kur"].select { |x| x["Kod"] == "USD"}.first["Alis"]
```

## Versions
0.0
- Initial version for getting currency data


## TO DO


## Howto Build
gem build akaynak.gemspec
gem push akaynak-0.0.gem