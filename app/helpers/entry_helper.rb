module EntryHelper
  def formatted_datestamp_for(entry)
    l(
      entry.date.in_time_zone(current_user.time_zone),
      format: :month_day_year
    )
  end
end
