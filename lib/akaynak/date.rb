module AKaynak
	class DATE
		def self.now
			format_date(Time.now)
		end

		def self.n_hour_from_now(duration)
			format_date(Time.now + duration*60*60)
		end

		def self.format_date(date)
			date.strftime('%d%m%Y%H%M')
		end
	end
end