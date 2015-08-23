helpers do
  MONTH_CONVERSION = {
    1 => "January",
    2 => "February",
    3 => "March",
    4 => "April",
    5 => "May",
    6 => "June",
    7 => "July",
    8 => "August",
    9 => "September",
    10 => "October",
    11 => "November",
    12 => "December"
  }

  def convert_date_format(datetime)
    year = datetime.year
    month = MONTH_CONVERSION[datetime.month]
    day = datetime.day
    "#{month} #{day}, #{year}"
  end
end
