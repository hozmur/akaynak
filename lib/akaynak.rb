require 'net/http'
require 'net/https'
require 'core-ext/hash'

require 'akaynak/configuration'
require 'akaynak/data'
require 'akaynak/date'
require 'akaynak/xml_body'

module AKaynak
  def self.root
    File.expand_path('../..', __FILE__)
  end
end

