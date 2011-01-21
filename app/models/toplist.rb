class Toplist < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :topic, :counter_cache => true
  has_many :items, :dependent => :destroy
  
  validates :user_id, :presence => true
  validates :topic_id, :presence => true
  validates_uniqueness_of :topic_id, :scope => :user_id
  
  accepts_nested_attributes_for :topic, :reject_if => proc { |attributes| attributes['title'].blank? }
  accepts_nested_attributes_for :items
  
  named_scope :ordered, :order => 'updated_at desc'
  
  def validate
    errors[:base] << 'Please use every item just once' if items.collect(&:title).uniq.size < 5
  end
  
  def build_items
    5.times do |i|
      items.build(:position => i + 1)
    end
  end
end