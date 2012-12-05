module RackErmahgerdDemo

  class Server
    ROUTES = [
      {pattern: '/', object: 'Root', method: 'GET'},
      {pattern: '/', object: 'Root', method: 'POST'}
    ]

    def router(method, path)
      ROUTES.find {|route| route[:pattern] == path && route[:method] == method}
    end

    def call(env)
      begin
        route = router(env["REQUEST_METHOD"], env["PATH_INFO"])
        raise "PAGE NOT FOUND" unless route
        response = Object::const_get("RackErmahgerdDemo").const_get(route[:object]).send(route[:method].downcase.to_sym, env)
      rescue 
        response = [404, {'Content-Type' => 'text/html'}, ['<h4>404! Page not found</h4>']]
      end
      response
    end

  end

end