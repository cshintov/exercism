defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search({key}, key), do: {:ok, 0}
  def search(tuple, key), do: do_search(tuple, key, {0, tuple_size(tuple)-1})

  # When start is greater than end, it's not there!
  defp do_search(_tuple, _key, {s, e}) when s > e, do: :not_found

  defp do_search(tuple, key, {s, e}) do
    mid = div(s + e, 2)

    case elem(tuple, mid) do
      ^key -> {:ok, mid} # found it!
      mid_elem when key < mid_elem -> do_search(tuple, key, {s, mid-1}) # go left
      mid_elem when key > mid_elem  -> do_search(tuple, key, {mid+1, e}) # go right
    end
  end
end
