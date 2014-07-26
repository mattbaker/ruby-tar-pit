class Relation
  def self.attributes
    @attributes ||= []
  end

  def self.attribute(name)
    @attributes ||= []
    @attributes << name
  end

  def description
    self.class
      .attributes
      .map {|prop| "#{prop}: #{self.send(prop)}"}
      .join("\n")
  end
end