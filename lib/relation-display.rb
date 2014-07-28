module RelationDisplay
  def header_str(max_lengths)
    header = attributes.keys
      .map { |attribute|
        " " + attribute.to_s.ljust(max_lengths[attribute])
      }
      .join(" | ")
  end

  def row_str(record, max_lengths)
    attributes.keys
      .map { |attribute|
        " " + record.send(attribute)
        .to_s
        .ljust(max_lengths[attribute])

      }
      .join(" | ")
  end

  def to_s
    all_records = self.all
    max_lengths = attributes.keys.each_with_object({}) do |name, max_lengths|
      max_value_length = all_records
        .map(&name)
        .map(&:to_s)
        .map(&:length)
        .max
      max_lengths[name] = [name.to_s.length, max_value_length].max+1
    end

    name = "\e[1m#{self.name} (#{all_records.length})\e[0m"
    header = header_str(max_lengths)
    header_break = "-" * header.length
    rows = all_records.map { |record| row_str(record, max_lengths) }

    [name,
     "=" * header.length,
     header,
     "-" * header.length,
     rows,
     header_break].flatten.join("\n")+"\n\n"
  end
end