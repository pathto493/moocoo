module SecondsToMinuteHelper
  def seconds_to_minute(seconds)
    minutes = seconds / 60
    seconds = seconds % 60
    return "#{minutes}:#{seconds}"
  end
end
