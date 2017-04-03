module ApplicationHelper
  def custom_sort(collection, order)
    collection.sort { |a,b| order.index(a) <=> order.index(b) }
  end

  def custom_sort_by(collection, key, order)
    collection.sort { |a,b| order.index(a[key]) <=> order.index(b[key]) }
  end
end
