defmodule HelloNerves.Morse do
  # Durations in ms
  @unit 200
  @dot @unit
  @dash @unit * 3
  @space_between_parts @unit
  @space_between_letters @unit * 3
  @space_between_words @unit * 7

  alias Nerves.Leds

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def start_link() do
    led_list = Application.get_env(:hello_nerves, :led_list)
    spawn(fn -> blink_list_forever(led_list) end)
    {:ok, self()}
  end

  defp blink_list_forever(led_list) do
    Enum.each(led_list, &blink(&1))
    :timer.sleep(@unit * 10)
    blink_list_forever(led_list)
  end

  defp blink(led_key) do
    Regex.scan(~r/./, Morse.encode("SOS"))
    |> Enum.each(&blink(led_key, &1))
  end

  defp blink(led_key, ["."]) do
    Leds.set([{led_key, true}])
    :timer.sleep(@dot)
    Leds.set([{led_key, false}])
    :timer.sleep(@unit)
  end

  defp blink(led_key, ["-"]) do
    Leds.set([{led_key, true}])
    :timer.sleep(@dash)
    Leds.set([{led_key, false}])
    :timer.sleep(@unit)
  end

  defp blink(_, [" "]) do
    :timer.sleep(@space_between_letters)
  end
end
