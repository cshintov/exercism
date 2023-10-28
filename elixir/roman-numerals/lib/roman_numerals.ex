defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  http://www.novaroma.org/via_romana/numbers.html
  """
  @test [
    {1000, "M"},
    {500, "D"},
    {100, "C"},
    {50, "L"},
    {10, "X"},
    {5, "V"},
    {1, "I"}
  ]

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
  def numeral(n) when n > 0, do: encode(n, "")

  defp encode(0, encoded), do: encoded

  for {arabic, roman} <- @arabic_to_roman do
    defp encode(n, encoded) when n >= unquote(arabic),
      do: encode(n - unquote(arabic), encoded <> unquote(roman))
  end

end
