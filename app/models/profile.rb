class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user

  #expects a string as follows: [feet]'[inches]"
  #converts value to height in inches
  def height=(s)
    #should add some checks to make sure s is a well-formatted string
    strs = s.split(/\\|'/)
    self[:height] = strs[0].to_i * 12 + strs[1].to_i
  end

  #converts height in inches value to a string
  #string format is: [feet]'[inches]"
  def height
    temp = self[:height]
    feet = temp / 12
    inch = temp % 12
    "" + feet.to_s + "'" + inch.to_s + "\""
  end

  validates :weight, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
  validates :height, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
end
