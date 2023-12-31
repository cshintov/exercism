#IO.inspect(Enum.take(fact,10), charlists: :as_lists)

defmodule Test do
  def fact_stream do
    Stream.unfold({0, 1}, fn
      {0, 1} -> {1, {1, 2}}
      #                     <out, in>
      #                     <next term in the output>, <next input> 
      {cur, next} -> {cur, {cur * next, next+1}}
    end)
  end

  @doc """
  There are two forms for the next_fun
  1. current -> {current, next}
  2. {current, next} -> {current, {out_fn(cur, next), next_term(current, next)}}

  Or think of the return value of the next_fun as a pipe.

         out ===== in   ~=   {out, in}

  out = next term in the output series
  in = next term in the input series
  """

  def fib_stream do
    Stream.unfold({1, 1}, fn {cur, next} -> {cur, {next, cur + next}} end)
  end

  def pos_nums do
    Stream.unfold(1, fn n -> {n, n+1} end)
  end

  def pos_nums1 do
    Stream.unfold(
      {1, 2},
      fn {out, inp} -> {out, {inp, inp + 1}} end
    )
  end
end
