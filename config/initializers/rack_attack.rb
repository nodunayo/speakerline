require 'ipaddr'

class Rack::Attack
  RANGE = (IPAddr.new('5.188.211.0').to_i..IPAddr.new('5.188.211.255').to_i)
  blocklist('block 5.188.211.*') do |req|
   RANGE.include?(IPAddr.new(req.ip).to_i)
  end

  throttle('proposals', limit: 1, period: 1.second) do |req|
    req.ip if req.path == '/proposals' && req.post?
  end
end
