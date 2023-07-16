defmodule FreelancerRates do
  @man_hours 8.0
  @man_days 22.0

  def daily_rate(hourly_rate) do
    @man_hours * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(FreelancerRates.apply_discount(@man_hours * hourly_rate * @man_days, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    actual = (100 * budget) / (100 - discount)
    Float.floor(actual / (hourly_rate * @man_hours), 1)
  end
end
