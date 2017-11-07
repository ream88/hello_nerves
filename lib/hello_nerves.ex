defmodule HelloNerves do
  # Durations in ms
  @on_duration 200
  @off_duration 200

  alias Nerves.Leds

  def start(_type, _args) do
    led_list = Application.get_env(:hello_nerves, :led_list)
    spawn(fn -> blink_list_forever(led_list) end)
    {:ok, self()}
  end

  defp blink_list_forever(led_list) do
    Enum.each(led_list, &blink(&1))
    blink_list_forever(led_list)
  end

  defp blink(led_key) do
    Leds.set([{led_key, true}])
    :timer.sleep(@on_duration)
    Leds.set([{led_key, false}])
    :timer.sleep(@off_duration)
  end
end
