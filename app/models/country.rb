class Country < OpenStruct
  SOURCE_FILE = 'db/countries.csv'.freeze

  def self.find_by_name(country_name)
    CSV.foreach("#{Rails.root}/#{SOURCE_FILE}", headers: true, header_converters: :symbol) do |row|
      return new(row.to_h) if row[:name] == country_name
    end
  end
end
