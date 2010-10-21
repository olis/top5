class Toplist < ActiveRecord::Base
  belongs_to :topic
  has_many :items
  
  accepts_nested_attributes_for :topic, :reject_if => proc { |attributes| attributes['title'].blank? }
  accepts_nested_attributes_for :items
  
  default_scope :order => 'updated_at desc'
  
  def build_items
    5.times do |i|
      items.build(:position => i + 1)
    end
  end
end