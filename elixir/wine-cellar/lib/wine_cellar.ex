defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ [])
  def filter(cellar, color, year: year) do
    cellar
    |> filter_by_color(color)
    |> IO.inspect(label: "\nfilter by year: ")
    |> filter_by_year(year)
    |> IO.inspect(label: "\nfilter by year: ")
  end

  def filter(cellar, color, country: country) do
    cellar
    |> filter_by_color(color)
    |> IO.inspect(label: "\nfilter by country: ")
    |> filter_by_country(country)
    |> IO.inspect(label: "\nfilter by country: ")
  end

  def filter(cellar, color, year: year, country: country) do
    cellar
    |> filter_by_color(color)
    |> IO.inspect(label: "\nfilter by year and country: ")
    |> filter_by_year(year)
    |> IO.inspect(label: "\nfilter by year and country: ")
    |> filter_by_country(country)
    |> IO.inspect(label: "\nfilter by year and country: ")
  end

  def filter(cellar, color, country: country, year: year) do
    cellar
    |> filter_by_color(color)
    |> IO.inspect(label: "\nfilter by year and country: ")
    |> filter_by_year(year)
    |> IO.inspect(label: "\nfilter by year and country: ")
    |> filter_by_country(country)
    |> IO.inspect(label: "\nfilter by year and country: ")
  end

  def filter(cellar, color, _) do
    cellar
    |> filter_by_color(color)
  end

  defp filter_by_color([], color), do: []

  defp filter_by_color([wine | rest], color) when elem(wine, 0) == color do
    [elem(wine, 1) | filter_by_color(rest, color)]
  end

  defp filter_by_color([ _ | rest], color) do
    filter_by_color(rest, color)
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
