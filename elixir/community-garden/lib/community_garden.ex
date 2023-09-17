# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  use Agent

  def start(_opts \\ []) do
    Agent.start_link(fn -> %{id: 0, plots: []} end, name: __MODULE__)
  end

  def list_registrations(pid), do: Agent.get(pid, & &1.plots)

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{id: id, plots: plots} ->
      new_plot = %Plot{plot_id: id+1, registered_to: register_to}
      {new_plot, %{id: id+1, plots: [new_plot | plots]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid,
      fn %{plots: plots} = state ->
        %{state | plots: Enum.filter(plots, & &1.plot_id != plot_id)}
      end
    )
  end

  def get_registration(pid, plot_id) do
    not_found = {:not_found, "plot is unregistered"}
    Agent.get(pid,
      &Enum.find(&1.plots, not_found, fn plot -> plot.plot_id == plot_id end)
    )
  end
end
