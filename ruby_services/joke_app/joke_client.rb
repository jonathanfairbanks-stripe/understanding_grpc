this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'jokes_services_pb'

def main
  number_of_jokes = ARGV.size > 0 ?  ARGV[0].to_i : 1
  hostname = ARGV.size > 1 ?  ARGV[1] : 'localhost:50051'
  stub = ::Jokes::Storage::Stub.new(hostname, :this_channel_is_insecure)
  begin
    joke = stub.get_joke(Jokes::JokesRequest.new(number_of_jokes: number_of_jokes)).joke
    puts "Joke Recieved:\n#{joke}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
