# == Schema Information
#
# Table name: machines
#
#  id               :integer          not null, primary key
#  identifier       :string(255)
#  name             :string(255)
#  explain          :string(255)
#  operating_status :integer          default(0)
#  customer_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Machine < ActiveRecord::Base
  belongs_to :customer
  has_one :machine_detail
  has_many :disk_infos
  enum operating_status: { stoped: 0, running: 1 }

  after_initialize :generate_identifier

  #计算机器的cpu占比
  def cpu_percent
      cpu_used = eval(MachineInfo.get_info("cpu", identifier))["cpu_used"].to_f.round(1) 
      "#{cpu_use}%"
  end

  #计算指定机器的内存占用比
  def memory_percent
    memory_data = eval(MachineInfo.get_info("memory", identifier)) 
    memory_free = memory_data["memory_free_bytes"].to_f
    memory_total = memory_data["memory_total_bytes"].to_f
    memory_used = (((memory_total - memory_free) / memory_total) * 100).round(1)
    "#{memory_used}%"
  end

  private

  def generate_identifier
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    self.identifier ||= chars.sample(16).join
  end  

end
