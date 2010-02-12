require 'net/http'

module Litc

  # These are the items (for method missing)...
  #
  # 'ami-id' => :ami_id
  # 'block-device-mapping/ami' => :block_device_mapping_ami
  #
  ITEMS = %w(
    ami-id
    ami-launch-index
    ami-manifest-path
    block-device-mapping/
    block-device-mapping/ami
    block-device-mapping/ephemeral0
    block-device-mapping/swap
    block-device-mapping/root
    hostname
    instance-id
    instance-type
    local-hostname
    local-ipv4
    placement/
    placement/availability-zone
    public-hostname
    public-ipv4
    public-keys/
    reservation-id
    security-groups
    user-data
  )

  # Version of the API to use, any one of:
  #   1.0
  #   2007-01-19
  #   2007-03-01
  #   2009-08-15
  #   latest
  API_VERSION = "latest"

  def self.urlize item
    item = item.to_s.gsub(/_/, '-')
    if item =~ /(placement).+/ or item =~ /(block-device-mapping).+/
      item.gsub!(/(#{$1})-(.*)$/,'\\1/\\2')
    end
    if item =~ /block-device-mapping$/ or item =~ /placement$/ or item =~ /public-keys$/
      item << "/"
    end
    item
  end

  def self.get(item)
    item = urlize(item)

    if item != 'user-data'
      item = "meta-data/#{item}"
    end

    response = Net::HTTP.get_response(URI.parse("http://169.254.169.254/#{API_VERSION}/#{item}"))
    
    case response
    when Net::HTTPSuccess then response.body.strip
    else nil
    end
  end

  def self.method_missing(meth, *args, &block)
    if ITEMS.include?(urlize(meth))
      get(meth)
    else
      raise(NoMethodError, "undefined method '#{meth}' for Litc")      
    end
  end

end
