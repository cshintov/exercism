defmodule Username do
  @allowed [?_] ++ for char <- ?a..?z, do: char

  def replace_german(char) do
    case char do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _  -> [char]
    end
  end

  def sanitize(username) do
    username
      |> Enum.flat_map(&replace_german/1)
      |> IO.inspect()
      |> Enum.filter(fn char -> char in @allowed end)
  end
end

