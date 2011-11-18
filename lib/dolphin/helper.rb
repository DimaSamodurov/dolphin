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
      return false unless key = Dolphin.features[name.to_sym]

      if flipper = Dolphin.flippers[key.to_sym]
        instance_eval(&flipper)
      end

    rescue => e
      warn "[Dolphin] Error checking feature #{name}:#{key} - #{e}"
      false
    end

    alias_method :feature?, :feature_available?

  end
end
