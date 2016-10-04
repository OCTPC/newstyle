class Relationship < ActiveRecord::Base
  belongs_to :content, :class_name => 'Relationship', :foreign_key => 'a_id'
  belongs_to :content, :class_name => 'Relationship', :foreign_key => 'b_id'
end
