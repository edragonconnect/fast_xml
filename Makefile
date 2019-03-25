all: src

src:
	./rebar3 get-deps compile

clean:
	./rebar3 clean

test: all
	./rebar3 -v skip_deps=true eunit

# We assume Elixir and Quviq Quickcheck are installed
exunit:
	MIX_EXS=test/elixir/mix.exs mix test

check-syntax:
	gcc -o nul -S ${CHK_SOURCES}

.PHONY: clean src test all
