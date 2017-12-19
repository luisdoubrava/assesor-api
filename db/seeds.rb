
# Seed file for assesor-api

%i[nl fr en].each do |iso|
  Language.find_or_create_by_iso iso
end
