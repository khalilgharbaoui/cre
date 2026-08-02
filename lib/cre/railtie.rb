# Deprecated: this Railtie has always been empty and cre no longer loads it
# by default. The constant is kept so existing references keep working.
# It will be removed in cre 3.0.
if defined?(::Rails::Railtie)
  module Cre
    class Railtie < ::Rails::Railtie
    end
  end
end
