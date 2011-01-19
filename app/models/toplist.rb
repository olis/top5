class Toplist < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :items, :dependent => :destroy
  
  validates_presence_of :user_id, :topic_id
  validates_uniqueness_of :topic_id, :scope => :user_id
  
  accepts_nested_attributes_for :topic, :reject_if => proc { |attributes| attributes['title'].blank? }
  accepts_nested_attributes_for :items
  
  default_scope :order => 'updated_at desc'
  
  def build_items
    5.times do |i|
      items.build(:position => i + 1)
    end
  end
end