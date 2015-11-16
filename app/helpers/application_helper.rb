module ApplicationHelper
  def alert_name(name)
    case name
    when "notice"
      "success"
    when "alert"
      "danger"
    else
      "info"
    end
  end


  # def pre_time(current_task_log, task_logs)
  #   pre_tl = task_logs.select{ |tl| tl.start_time < current_task_log.start_time && tl.task_identifier == current_task_log.task_identifier }.first
  #   pre_tl.present? ?  ((current_task_log.start_time - pre_tl.start_time) / 60).round(1) : 0
  # end
  def last_get
    last_g = TaskLog.all.order('end_time DESC').last.end_time
  end

  def delay( len )
    chars = ("100".."200").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
  
end
