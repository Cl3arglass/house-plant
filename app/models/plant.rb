class Plant < ApplicationRecord

	 belongs_to :user
     belongs_to :comment

def comment_new=(new_comment)
    empty = new_comment[:note].nil? || new_comment[:note].blank?
    if !empty
      comment = Comment.find_or_create_by(note: new_comment[:note])
      self.comment = comment
    end
  end

  scope :by_name, -> { order(name: :asc) }

end
