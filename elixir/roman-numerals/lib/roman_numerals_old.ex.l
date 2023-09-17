defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  http://www.novaroma.org/via_romana/numbers.html
  """

  @arabic_to_roman [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(n) when n > 0, do: encode(n, @arabic_to_roman, "")

  defp encode(_, [], encoded), do: encoded

  defp encode(n, [{arabic, roman} | _] = arabic_to_roman, encoded)
    when n >= arabic,
    do: encode(n - arabic, arabic_to_roman, encoded <> roman)

  defp encode(n, [_ | rest], encoded), do: encode(n, rest, encoded)
end
