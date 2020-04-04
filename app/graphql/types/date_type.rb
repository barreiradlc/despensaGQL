class Types::DateType < Types::BaseObject

    def self.coerce_input(value, _context)
      Date.parse(value)
    rescue ArgumentError
      # Invalid input
      nil
    end

    def self.coerce_result(value, _context)
      value.to_s
    end

  end