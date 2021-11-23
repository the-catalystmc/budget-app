module GroupHelper
  def total_expenses_all
    total = 0
    Report.all.each { |r| total += r.amount }
    total
  end
end
