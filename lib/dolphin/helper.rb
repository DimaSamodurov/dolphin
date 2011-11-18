module Dolphin
  module Helper

    def feature(name, partial_options = {}, &block)
      return nil unless feature_available?(name)

      if partial_options[:partial] && respond_to?(:render)
        render partial_options
      elsif block_given?
        yield
      end
    end

    def feature_available?(name)
      return false unless flipper = (Dolphin.features[name.to_sym] || Dolphin.features[name.to_s])

      if (flipper.is_a? TrueClass) or (flipper.is_a? FalseClass)
        flipper
      else
        proc = Dolphin.flippers[flipper.to_sym]
        instance_eval(&proc)
      end

    rescue => e
      warn "[Dolphin] Error checking feature #{name}:#{key} - #{e}"
      false
    end

    alias_method :feature?, :feature_available?

  end
end
