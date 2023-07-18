defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim |> String.first

  def initial(name) do
    name
      |> String.trim
      |> String.capitalize
      |> first_letter
      |> Kernel.<> "."
  end

  def initials(full_name) do
    [first, last] = full_name |> String.split
    initial(first) <> " " <> initial(last)
  end

  def pair(full_name1, full_name2) do
    top = """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    """

    middle = "**     #{initials(full_name1)}  +  #{initials(full_name2)}     **\n"

    bottom = """
      **                       **
        **                   **
          **               **
            **           **
              **       **
                **   **
                  ***
                   *
     """
     top <> middle <> bottom
  end
end
