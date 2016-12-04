class Question < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_for, against: :answer, using: { trigram: { threshold: 0.05 } }
end
