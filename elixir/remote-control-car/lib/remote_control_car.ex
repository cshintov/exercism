defmodule RemoteControlCar do

  @enforce_keys [:nickname]
  defstruct [
    battery_percentage: 100,
    distance_driven_in_meters: 0,
    nickname: nil
  ]

  @type t :: %__MODULE__{
    battery_percentage: non_neg_integer,
    distance_driven_in_meters: non_neg_integer,
    nickname: String.t(),
  }

  def new(nickname \\ "none"), do:
    %RemoteControlCar{
      nickname: nickname
    }

  def display_distance(
    %RemoteControlCar{distance_driven_in_meters: distance} = _
  ), do: "#{distance} meters"

  def display_battery(
    %RemoteControlCar{battery_percentage: 0} = _
  ), do: "Battery empty"

  def display_battery(
    %RemoteControlCar{battery_percentage: level} = _
  ), do: "Battery at #{level}%"

  def drive(%RemoteControlCar{
      battery_percentage: 0,
    } = remote_car
  ), do: remote_car

  def drive(%RemoteControlCar{
      distance_driven_in_meters: distance,
      battery_percentage: level,
    } = remote_car
  ), do:

    %RemoteControlCar{
      remote_car |
      battery_percentage: level - 1,
      distance_driven_in_meters: distance + 20
    }
end
