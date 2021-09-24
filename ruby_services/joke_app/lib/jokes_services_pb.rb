# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: jokes.proto for package 'jokes'

require 'grpc'
require 'jokes_pb'

module Jokes
  module Storage
    # The joke_storage.rb service
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'jokes.Storage'

      # ask a joke from joke_storage.rb
      rpc :GetJoke, ::Jokes::JokesRequest, ::Jokes::Joke
    end

    Stub = Service.rpc_stub_class
  end
end
