defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    divisible_by = &(rem(year, &1) == 0)

    cond do
      divisible_by.(400) -> true
      divisible_by.(100) -> false
      divisible_by.(4) -> true
      true -> false
    end
  end
end
