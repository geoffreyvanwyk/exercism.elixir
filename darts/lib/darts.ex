defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_from_center = :math.sqrt(x * x + y * y)
    missed_target = distance_from_center > 10
    on_outer_circle = distance_from_center > 5
    on_middle_circle = distance_from_center > 1
    on_inner_circle = distance_from_center >= 0

    cond do
      missed_target -> 0
      on_outer_circle -> 1
      on_middle_circle -> 5
      on_inner_circle -> 10
    end
  end
end
