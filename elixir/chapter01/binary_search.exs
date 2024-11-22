defmodule Binary do
  def search(value, list) do
    search(value, list, 0, length(list) - 1)
  end

  def search(value, list, low, high) do
    if low > high do
      {:error, "Value not found"}
    else
      mid = div(low + high, 2)
      mid_value = Enum.at(list, mid)

      cond do
        mid_value == value -> {:ok, mid}
        mid_value < value -> search(value, list, mid + 1, high)
        mid_value > value -> search(value, list, low, mid - 1)
      end
    end
  end
end

# Test
IO.inspect(Binary.search(50, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
