module SlugFind
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def to_param
      slug
    end
  end
end
