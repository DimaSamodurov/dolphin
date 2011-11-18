module Dolphin

  $LOAD_PATH << File.expand_path(File.dirname(__FILE__))
  require 'dolphin/helper'

  class << self
    def configure(&block)
      instance_exec self, &block
    end

    def flipper(name, &block)
      raise "Expected block returning boolean." unless block_given?
      flippers[name.to_sym] = block
    end

    def flippers
      @flippers ||= default_flippers
    end

    def features
      @features ||= {}
    end

    def features=(value)
      @features = value
    end

    def clear!
      features.clear
      flippers.clear
    end

  private

    def default_flippers
      {
        :enabled    => Proc.new { true },
        :disabled   => Proc.new { false },
        :true       => Proc.new { true },
        :false      => Proc.new { false },
        :on         => Proc.new { true },
        :off        => Proc.new { true }
      }
    end
  end

end
