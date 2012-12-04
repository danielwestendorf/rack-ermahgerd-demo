module RackErmahgerdDemo

  class Server

    def router(method, path)
      #this is stupid, but should work for now.
      case method
      when "GET"
        case path
        when "/"
          'Root'
        else
          return nil
        end
      when "POST"
        case path
        when "/"
          'Root'
        else
          return nil
        end
      else
        return nil
      end
    end

    def call(env)
      begin
        object = router(env["REQUEST_METHOD"], env["PATH_INFO"])
        response = Object::const_get("RackErmahgerdDemo").const_get(object).send(env["REQUEST_METHOD"].downcase.to_sym, env)
      rescue 
        response = [404, {'Content-Type' => 'text/html'}, ['<h4>404! Page not found</h4>']]
      end
      response
    end

  end

end