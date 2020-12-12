require_relative 'clean_input'

REQUIRED_IDENTIFIERS = %w[byr iyr eyr hgt hcl ecl pid]
# cid

def parse_passport(passport_string)
  parts = passport_string.split(' ')
  parts.map { |part| part.split(':') }.to_h
end

def validate_credentials(passport_hash)
  return false if (REQUIRED_IDENTIFIERS - passport_hash.keys).size.positive?

  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  return false if passport_hash["byr"].to_i < 1920 || passport_hash["byr"].to_i > 2002

  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  return false if passport_hash["iyr"].to_i < 2010 || passport_hash["iyr"].to_i > 2020

  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  return false if passport_hash["eyr"].to_i < 2020 || passport_hash["eyr"].to_i > 2030

  # hgt (Height) - a number followed by either cm or in:
  #   If cm, the number must be at least 150 and at most 193.
  #   If in, the number must be at least 59 and at most 76.
  height_match = passport_hash["hgt"].match /\A(\d+)(cm|in)\z/
  return false if height_match.nil?
  value, metric = height_match.captures
  if metric == "cm"
    return false if value.to_i < 150 || value.to_i > 193
  elsif metric == "in"
    return false if value.to_i < 59 || value.to_i > 76
  else
    raise StandardError
  end

  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  hair_color_match = passport_hash["hcl"].match /\A#[0-9a-f]{6}\z/
  return false if hair_color_match.nil?

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  eye_colors = %w[amb blu brn gry grn hzl oth]
  return false unless eye_colors.include?(passport_hash["ecl"])

  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  pid_match = passport_hash["pid"].match /\A\d{9}\z/
  return false if pid_match.nil?

  true
end

passports = INPUT.split(',')

valid_passports =
  passports
    .map(&method(:parse_passport))
    .filter(&method(:validate_credentials))

puts valid_passports.size
