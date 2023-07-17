defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list) do
    [_ | rest] = list
    rest
  end

  def first(list) do
    [first | _] = list
    first
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
