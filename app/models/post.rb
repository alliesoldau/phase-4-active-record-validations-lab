class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title_cant_be_true_facts

    def title_cant_be_true_facts
        if title == "True Facts"
            errors.add(:title, "Can't be True Facts")
        end
    end
end
