# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end


defmodule CommunityGarden do
  use Agent

  #defstruct [:next_id, :plots]

  def start(_opts \\ []) do
    Agent.start_link(fn -> %{id: 1, plots: %{}} end, name: __MODULE__)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{id: id, plots: plots} -> Map.values(plots) end)
  end


  #def register(pid, register_to) do
    #Agent.get_and_update(pid, fn %{id: id, plots: plots} ->
      #new_plot = %Plot{plot_id: id+1, registered_to: register_to}
      #{new_plot, %{id: id+1, plots: [new_plot | plots]}}
    #end)
  #end

#  def register(pid, register_to) do
    #state = Agent.get(pid, fn state -> state end)

    #Agent.update(pid, fn %{id: id, plots: plots} ->
      #new_plot = %Plot{plot_id: id+1, registered_to: register_to}
      #%{id: id+1, plots: [new_plot | plots]}
    #end)

    #new_plot
  #end

  def register(pid, register_to) do
    state = Agent.get(pid, fn state -> state end)
    %{plots: plots, id: next_id} = state

    new_plot = %Plot{plot_id: next_id, registered_to: register_to}
    updated = Map.put(plots, next_id, new_plot)

    state = %{state | plots: updated, id: next_id + 1}
    Agent.update(pid, fn x -> state end)

    new_plot
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
