module StringHelpers

  def humanize(s)
    s.gsub(/_+/,' ')
  end

  def titlecase(s)
    s.split(/[[:space]]/).map{|w| w.upcase}.join(" ")
  end

end
