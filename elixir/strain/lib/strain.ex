defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: do_keep(list, fun, [])

  defp do_keep([], _fun, keeps), do: keeps
  defp do_keep([h | t], fun, keeps) do
    do_keep_inner(fun.(h), h, t, fun, keeps)
  end

  defp do_keep_inner(true, h, t, fun, keeps), do: do_keep(t, fun, keeps ++ [h])
  defp do_keep_inner(false, _h, t, fun, keeps), do: do_keep(t, fun, keeps)

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: keep(list, fn e -> not fun.(e) end)
end
