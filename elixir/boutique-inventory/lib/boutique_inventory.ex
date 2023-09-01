defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: inventory |> Enum.sort_by(&(&1.price))

  def with_missing_price(inventory) do
    inventory |> Enum.filter(fn x -> x.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory |> Enum.map(&replace_name(&1, old_word, new_word))
  end

  defp replace_name(%{name: name} = item, old, new) do
    %{item | name: String.replace(name , old, new)}
  end

  def increase_quantity(%{quantity_by_size: sizes} = item, count) do
    add_count = fn {k, v} -> {k , v + count} end
    %{item | quantity_by_size: Map.new(sizes, add_count)}
  end

  def total_quantity(%{quantity_by_size: sizes}) do
    sizes |> Enum.reduce(0, fn {_, v}, acc -> v + acc end)
  end
end
