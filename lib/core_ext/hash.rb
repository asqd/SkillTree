class Hash
  def deep_diff(other)
    (self.keys + other.keys).uniq.inject({}) do |memo, key|
      left = self[key]
      right = other[key]

      next memo if left == right

      if left.respond_to?(:deep_diff) && right.respond_to?(:deep_diff)
        memo[key] = left.deep_diff(right)
      else
        memo[key] = [left, right]
      end

      memo
    end
  end
end