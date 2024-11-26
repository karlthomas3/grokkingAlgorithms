defmodule Selection do
  @spec sort(list(integer)) :: list(integer)
  def sort([]), do: []

  def sort([h | t]) do
    small = smallest([h | t])
    [small | sort(remove([h | t], small))]
  end

  @spec smallest(list(integer)) :: integer
  def smallest([h | t]), do: smallest(t, h)
  def smallest([], num), do: num
  def smallest([h | t], num) when h < num, do: smallest(t, h)
  def smallest([h | t], num) when h > num, do: smallest(t, num)

  @spec remove(list(integer), integer) :: list(integer)
  def remove([], _), do: []
  def remove([h | t], num) when h == num, do: t
  def remove([h | t], num), do: [h | remove(t, num)]
end

# Test
IO.inspect(Selection.sort([5, 3, 6, 2, 10, 1, 4, 9, 8, 7]))
