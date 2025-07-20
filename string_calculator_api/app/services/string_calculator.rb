class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?('//')
      header, numbers = numbers.split("\n", 2)
      custom = header[2..]

      if custom.start_with?('[')
        # Extract multiple delimiters like [***][%%]
        delimiters = custom.scan(/\[(.+?)\]/).flatten.map { |d| Regexp.escape(d) }
        delimiter = Regexp.new(delimiters.join('|'))
      else
        delimiter = Regexp.new(Regexp.escape(custom))
      end
    end

    nums = numbers.split(delimiter).map(&:to_i).reject { |n| n > 1000 }
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end
end
