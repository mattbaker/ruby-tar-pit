module RelationOperations
  def extend_relation(attributes={})
    create(self, attributes: attributes)
  end

  def restrict(criterion)
    create(self, restriction: criterion)
  end

  def project(*attributes)
    create(self, retain: attributes)
  end

  def project_away(*attributes)
    create(self, remove: attributes)
  end

  def join(relation)
    create(self, join: relation)
  end

  def create(base, args={})
    Class.new(Relation) do
      include_relation base
      join_with args[:join] if args[:join]
      extend_attributes args[:attributes] if args[:attributes]
      with_restriction args[:restriction] if args[:restriction]
      remove_attributes args[:remove] if args[:remove]
      retain_attributes args[:retain] if args[:retain]
    end
  end

  def include_relation(base)
    @base = base
    extend_attributes @base.attributes
  end

  def join_with(join)
    @join = join
    extend_attributes @join.attributes
  end

  def remove_attributes(names)
    attributes.delete_if {|name,_| names.include? name}
  end

  def retain_attributes(names)
    self.remove_attributes(self.attributes.keys - names)
  end

  def extend_attributes(attributes)
    attributes.each do |name, fnc|
      attribute name, fnc
    end
  end

  def with_restriction(criterion)
    @restriction = criterion
  end

  def restriction
    @restriction ||= ->(record){ true }
  end
end