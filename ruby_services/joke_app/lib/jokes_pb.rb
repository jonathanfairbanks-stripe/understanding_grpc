# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: jokes.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("jokes.proto", :syntax => :proto3) do
    add_message "jokes.JokesRequest" do
      optional :number_of_jokes, :int32, 1
    end
    add_message "jokes.Joke" do
      optional :joke, :string, 1
    end
  end
end

module Jokes
  JokesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("jokes.JokesRequest").msgclass
  Joke = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("jokes.Joke").msgclass
end