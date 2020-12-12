require_relative 'clean_input'

REQUIRED_IDENTIFIERS = %w[byr iyr eyr hgt hcl ecl pid]
# cid

# ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm
def parse_passport(passport_string)
  parts = passport_string.split(' ')
  parts.map { |part| part.split(':') }.to_h
end

def validate_credentials(passport_hash)
  (REQUIRED_IDENTIFIERS - passport_hash.keys).size.zero?
end

passports = INPUT.split(',')

valid_passports =
  passports
    .map(&method(:parse_passport))
    .filter(&method(:validate_credentials))

puts valid_passports.size
