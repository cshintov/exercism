defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)

  defp do_count([], cnt), do: cnt
  defp do_count([_ | t], cnt), do: do_count(t, cnt+1)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])

  defp do_reverse([], rev), do: rev
  defp do_reverse([h | t], rev), do: do_reverse(t, [h | rev])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(ListOps.reverse(l), f, [])

  defp do_map([], _f, mapped), do: mapped
  defp do_map([h | t], f, mapped), do: do_map(t, f, [f.(h) | mapped])

  @doc """
  Filter a list
  """
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: do_filter(ListOps.reverse(l), f, [])

  defp do_filter([], _f, filtered), do: filtered
  defp do_filter([h | t], f, filtered), do: filter_helper(f.(h), h, t, f, filtered)

  defp filter_helper(keep, _, t, f, filtered)
    when keep == false or keep == nil, do: do_filter(t, f, filtered)

  defp filter_helper(_, h, t, f, filtered), do: do_filter(t, f, [h | filtered])

  @doc """
  Implement left fold
  """

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _), do: acc
  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @doc """
  Implement right fold
  """

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: foldl(ListOps.reverse(l), acc, f)

  @doc """
  Implement append to list
  """

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append(a, b) do
    a
    |> ListOps.reverse
    |> do_append(b)
    |> ListOps.reverse
  end

  defp do_append(a, []), do: a
  defp do_append(a, [h | t]), do: do_append([h | a], t)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll, [])

  defp do_concat([], acc), do: acc
  defp do_concat([h | t] = ll, acc), do: do_concat(t, ListOps.append(acc, h))
end
