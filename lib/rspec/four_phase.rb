require "rspec/four_phase/version"

module Rspec
  module FourPhase
    require 'logger'
    require 'rspec/four_phase/hooks'

    def self.log
      @log ||= Logger.new(STDOUT)
    end
  end
end
