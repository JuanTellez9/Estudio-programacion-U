defmodule MiProyectoTest do
  use ExUnit.Case
  doctest MiProyecto

  test "greets the world" do
    assert MiProyecto.hello() == :world
  end
end
