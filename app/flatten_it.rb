class Array
  def flatten_it(level = nil)
    @level = level

    res = []
    each do |elm|
      if elm.nil? || !(elm.is_a?(Array) && level?)
        res << elm
      else
        res += elm.flatten_it(next_level)
      end
    end
    res
  end

  def flatten_it!(level = nil)
    res = replace(flatten_it(level))
    return nil if res == self
  end

  private

  def level?
    @level.nil? || @level > 0
  end

  def next_level
    return nil if @level.nil?
    @level - 1
  end
end
