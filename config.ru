$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '/lib'))
require 'rack-ermahgerd-demo'

use Rack::Static, root: "public", urls: ["/css", "/img", "/js"]
use Rack::Ermahgerd
run RackErmahgerdDemo::Server.new