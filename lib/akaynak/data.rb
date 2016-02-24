module AKaynak
	class Data
		def self.get_currency(opts={})
			final_result = {status: false, error_code: nil, error_message: nil}
			#valid_options = opts.only(:from, :start_date, :stop_date, :turkish)
			#valid_options.merge!(:start_date => NetGSM::DATE.now) unless valid_options[:start_date]
			#valid_options.merge!(:stop_date => NetGSM::DATE.n_hour_from_now(1)) unless valid_options[:stop_date]

			body = AKaynak::XmlBody.get_currency()

			response = send_request(body)

			result = parse_response(response)
			if result
				final_result[:status] = true
				final_result[:result] = result
			end
			return final_result
		end

		def sms_status
			'OK status'
		end

		def check_balance
			'OK Balance'
		end

		def initialize(auth_options={})
			@auth_options = auth_options
		end

		def self.send_request(body)
		    header = { 
		      "Content-Type" => "text/xml; charset=utf-8", 
		      "Content-Length" => body.bytesize.to_s, 
		      "Accept" => "*/*" 
		    }

		    request = Net::HTTP::Post.new('/DataService.asmx', header)
		    request.body = body
		    #puts  "Request #{@header} #{request.body} "
		    response = Net::HTTP.new(AKaynak.configuration.host, AKaynak.configuration.port).start {|http| http.request(request) }
		    #puts "Response #{response.code} #{response.message}: #{response.body}"

		    # parser = XMLRPC::XMLParser::REXMLStreamParser::StreamListener.new
		    # parser.parse(response.body)

		    return response.body
		end

		def self.parse_response(body)
			require 'active_support/core_ext/hash/conversions'
			begin
				result_hash = Hash.from_xml(body)
				result_xml = result_hash["Envelope"]['Body']["GetCurrencyResponse"]["GetCurrencyResult"]
				currency_hash = Hash.from_xml(result_xml)
				return currency_hash
			rescue Exception => e
				puts "ERROR: #{e.message}"
				return nil
			end
		end
	end
end