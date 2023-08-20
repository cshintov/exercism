defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(n) when n < 4, do: [n]
  def factors_for(n), do: do_factors_for(n, 2, [])

  defp do_factors_for(1, _f, factors), do: factors

  defp do_factors_for(n, f, factors) when rem(n, f) == 0 do
    do_factors_for(div(n, f), f, factors ++ [f])
  end

  defp do_factors_for(n, f, factors), do: do_factors_for(n, f+1, factors)
end
