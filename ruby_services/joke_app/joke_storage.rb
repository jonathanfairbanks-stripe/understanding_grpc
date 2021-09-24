require_relative 'lib/setup'

RANDOM_JOKES = [
  "I'm afraid for the calendar. Its days are numbered.",
  "Why do fathers take an extra pair of socks when they go golfing? - In case they get a hole in one!"
]

class JokeStorage < ::Jokes::Storage::Service
  def get_joke(request, _unused_call)
    puts "Got asked a joke!!!"
    ::Jokes::Joke.new(joke: RANDOM_JOKES.sample(request.number_of_jokes).join("\n"))
  end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(JokeStorage)
  # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to 
  #   gracefully shutdown.
  # User could also choose to run server via call to run_till_terminated
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
