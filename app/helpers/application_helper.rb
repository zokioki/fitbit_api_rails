module ApplicationHelper
  def time_based_greeting(time_zone)
    current_hour = Time.current.in_time_zone(time_zone).hour

    if current_hour.between?(5, 11)
      "Good morning"
    elsif current_hour.between?(12, 17)
      "Good afternoon"
    else
      "Good evening"
    end
  end
end
