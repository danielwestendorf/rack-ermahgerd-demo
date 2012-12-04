module RackErmahgerdDemo
  class Root
    def self.get(env)
      text = ""
      body = TMPL.result(binding)
      [200, {'Content-Type' => 'text/html'}, [body]]
    end

    def self.post(env)
      input = env['rack.input'].read
      text = Rack::Utils.unescape(input).split('=')[-1]
      
      body = TMPL.result(binding)
      [200, {'Content-Type' => 'text/html'}, [body]]
    end
  end

TMPL = ERB.new <<-EOF
  <!DOCTYPE html>
  <html>
    <head>
      <title>ERMAHGERD! Translate my post</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
      <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
      <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <a class="brand" href="http://github.com/danielwestendorf/rack-ermahgerd-demo">Rack-Ermahgerd Demo</a>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="/">Try it!</a></li>
                <li><a href="http://github.com/danielwestendorf/rack-ermahgerd">Rack-Ermahgerd Source</a></li>
                <li><a href="http://github.com/danielwestendorf">Author</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </div>
      </div>
      <div id="content" class="container">
        <div class="row-fluid">
          <div class="span6 offset3">
            <p>This is a simple Rack app that uses the rack-ermahgerd middleware to translate the text.</p>
          </div>
          <div class="span6 offset3">
            <form action="/" method="POST">
              <textarea name="text"><%= text %></textarea><br>
              <input type="submit" value="Translate!" class="btn"/>
            </form>
          </div>
        </div>
      </div>
    </body>
    <style type="text/css">
      #content {margin-top: 60px;}
    </style>
  </html>
EOF
end