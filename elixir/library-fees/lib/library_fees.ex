defmodule LibraryFees do
  @monday 1
  @noon ~T[12:00:00]
  @days_allowed_if_before_noon 28
  @days_allowed_if_after_noon 29

  defp get_value({:ok, value}), do: value

  def datetime_from_string(string), do:
    string
    |> NaiveDateTime.from_iso8601
    |> get_value

  def before_noon?(datetime), do:
    datetime
    |> NaiveDateTime.to_time
    |> Time.before?(@noon)

  def return_date(checkout_datetime), do:
    checkout_datetime
    |> before_noon?
    |> do_return_date(checkout_datetime)

  defp do_return_date(true = _before_noon, checkout_datetime), do:
    checkout_datetime
    |> NaiveDateTime.add(@days_allowed_if_before_noon, :day)
    |> NaiveDateTime.to_date

  defp do_return_date(false = _before_noon, checkout_datetime), do:
    checkout_datetime
    |> NaiveDateTime.add(@days_allowed_if_after_noon, :day)
    |> NaiveDateTime.to_date

  def days_late(planned_return_date, actual_return_datetime), do:
    actual_return_datetime
    |> Date.diff(planned_return_date)
    |> positive_or_zero

  # Returns num if positive and zero if negative.
  defp positive_or_zero(num), do: max(num, 0)

  def monday?(datetime) do
    is_monday? = &(&1 == @monday)
    datetime
    |> NaiveDateTime.to_date
    |> Date.day_of_week
    |> is_monday?.()
  end

  def calculate_late_fee(checkout, return, rate) do
    [checkout, return] = Enum.map([checkout, return], &datetime_from_string/1)
    checkout
    |> return_date
    |> days_late(return)
    |> discounted(rate, monday?(return))
  end

  defp discounted(late, rate, true = _monday), do: rate * late |> div(2)
  defp discounted(late, rate, false = _monday), do: rate * late
end
