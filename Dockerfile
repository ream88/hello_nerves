FROM elixir:1.5

RUN mix local.hex --force
RUN mix local.rebar
RUN mix archive.install hex nerves_bootstrap --force

ENV MIX_TARGET=rpi
WORKDIR /home

COPY mix.* /home/
RUN mix deps.get
RUN mix compile

COPY . /home
