defmodule NameBadge do
  @owner "OWNER"

  def print(id, name, department) do
    department_name = if department == nil, do: @owner, else: department

    badge =
      if id == nil do
        "#{name} - #{String.upcase(department_name)}"
      else
        "[#{id}] - #{name} - #{String.upcase(department_name)}"
      end

    badge
  end
end
