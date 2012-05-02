require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    top = File.join(Dir.pwd, "/public")
    begin
      path = env["PATH_INFO"]
      file_path = File.join(top, Rack::Utils.unescape(path))
      raise SecurityError unless file_path.include?(top)
      file_path = File.join(top, "index.html") if path == '/'
      content = File.read(file_path)
      [200, {"Content-type" => "text/html", "Content-length" => content.size.to_s }, [content] ]
    rescue SecurityError
      content = File.read("public/403.html")
      [403, {"Content-type" => "text/html", "Content-length" => content.size.to_s }, [content] ]
    rescue Errno::ENOENT
      content = File.read("public/404.html")
      [404, {"Content-type" => "text/html", "Content-length" => content.size.to_s }, [content] ]
    rescue Exception => e
      content = File.read("public/500.html")
      [500, {"Content-type" => "text/html", "Content-length" => content.size.to_s }, [File.join(e.message, content)] ]
    end
  end
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292

