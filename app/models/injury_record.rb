class InjuryRecord < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :severity
  
  has_one    :event, :as => :schedulable, :dependent => :destroy
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :start_date
  validates_presence_of :severity

  validate :severity_within_bounds

  after_create  :build_injury_event
  after_update  :update_injury_event

  def severity_within_bounds
    unless self.severity > 0 && self.severity < 11
      self.errors[:base] << 'Severity must be between 1 and 10 (inclusive)'
    end
  end

  private
  def build_injury_event
    if self.start_date
      self.event = Event.create( :name => self.name, :start_at => self.start_date,
                                 :end_at => (self.end_date or (self.start_date + 7)),
                                 :user => self.user, :event_color => EventColor.red )
    end
    true
  end

  def update_injury_event
    if self.start_date
      if self.event
        self.event.update_attributes( :name => self.name, :start_at => self.start_date,
                                    :end_at => (self.end_date or (self.start_date + 7)) )
      else
        build_injury_event
      end
    end
  end

end
