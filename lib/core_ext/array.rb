class Array
  def deep_diff(array)
    largest = [self.count, array.count].max
    memo = {}

    0.upto(largest - 1) do |index|
      left = self[index]
      right = array[index]

      next if left == right

      if left.respond_to?(:deep_diff) && right.respond_to?(:deep_diff)
        memo[index] = left.deep_diff(right)
      else
        memo[index] = [left, right]
      end
    end

    memo
  end
end