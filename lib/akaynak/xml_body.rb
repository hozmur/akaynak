module AKaynak
	class XmlBody
		def self.get_currency()
			result = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:data='http://data.altinkaynak.com/'>
<soapenv:Header>
<data:AuthHeader>
<data:Username>#{AKaynak.configuration.usercode}</data:Username>
<data:Password>#{AKaynak.configuration.password}</data:Password>
</data:AuthHeader>
</soapenv:Header>
<soapenv:Body>
<data:GetCurrency/>
</soapenv:Body>
</soapenv:Envelope>"

			return result
		end

		def self.get_gold()
			result = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:data='http://data.altinkaynak.com/'>
<soapenv:Header>
<data:AuthHeader>
<data:Username>#{AKaynak.configuration.usercode}</data:Username>
<data:Password>#{AKaynak.configuration.password}</data:Password>
</data:AuthHeader>
</soapenv:Header>
<soapenv:Body>
<data:GetGold/>
</soapenv:Body>
</soapenv:Envelope>"

		 	#puts result
		 	return result
		end
	end
end