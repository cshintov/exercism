defmodule BasketballWebsite do
  def extract_from_path(data, path), do:
    path
    |> String.split(".")
    |> do_extract_from_path(data)

  defp do_extract_from_path([h | []], data), do: data[h]
  defp do_extract_from_path([h | t], data), do:
    do_extract_from_path(t, data[h])

  def get_in_path(data, path), do:
    get_in(data, String.split(path, "."))
end
