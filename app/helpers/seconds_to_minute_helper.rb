module SecondsToMinuteHelper
  def seconds_to_minute(seconds)
    minutes = seconds / 60
    seconds = seconds % 60
    return "#{minutes}:#{make_two_digit(seconds)}"
  end

  private

  def make_two_digit(number)
    if number < 10
      return "0#{number}"
    else
      return number
    end
  end
end
