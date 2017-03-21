module ApplicationHelper
  def custom_sort(collection, order)
    collection.sort { |a,b| order.index(a) <=> order.index(b) }
  end
end
