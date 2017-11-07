# Configuration for the Raspberry Pi A+ / B+ / B / Zero (target rpi)
use Mix.Config

config :hello_nerves, led_list: [:green]
config :nerves_leds, names: [green: "led0"]
