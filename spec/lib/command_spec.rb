require_relative '../spec_helper'
require 'command'

describe Command do
  it "recognises overview" do
    command = Command.new("overview\n")
    
    command.message.should eql 'overview'
    command.type.should eql :overview
  end
  
  it "recognises station command" do
    command = Command.new("station_bbc_radio_four\n")
    
    command.message.should eql 'station_bbc_radio_four'
    command.type.should  eql  :station
    command.param.should eql  :bbc_radio_four
  end
  
  it "recognises stop command" do
    command = Command.new("stop_station_bbc_radio_five\n")
    command.type.should  eql  :stop
    command.param.should eql  :station_bbc_radio_five
  end
  
  it "invalidates other commands" do
    expect { Command.new("silly_command\n") }.to raise_exception Command::NotFoundError
  end
  
  it "invalidates incomplete commands" do
    expect { Command.new("stop_\n") }.to raise_exception Command::NotFoundError
  end
end
