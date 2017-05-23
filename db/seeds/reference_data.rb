single = CaseType.create!(
  name: 'Single Adult',
  description: 'Single adult homeless client'
)
CaseType.create!(name: 'Single Adult Male', parent: single)
CaseType.create!(name: 'Single Adult Female', parent: single)
CaseType.create!(
  name: 'Adult Family',
  description: 'Case type consisting of two or more related adults, \
no children under 18'
)
CaseType.create!(
  name: 'Family with Children',
  description: 'Case type consisting of families with children under 18, \
includes pregnant single women'
)
ShelterType.create!(
  name: 'Shelter',
  description: 'regular shelter that does not qualify as tier 2'
)
ShelterType.create!(
  name: 'Late Arrival',
  code: 'FTC005',
  description: 'Overnight shelter for families with children that arrive after '\
  '5pm; they are placed in the shelters and then in the morning return to an '\
  'intake center (e.g. PATH) to finish the application process.'
)
ShelterType.create!(
  name: 'Hotel',
  description: 'A currently-operating hotel that for may agree to provide rooms'\
  ' at regular commercial rates for emergency shelter use for overflow clients.'\
  '  Facility type “hotel” includes both converted former hotel buildings as '\
  'well as active commercial hotels.'
)
ShelterType.create!(
  name: 'Cluster',
  description: 'An apartment in a private apartment building that is used to'\
  'house homeless, as well as renting families. Social services are limited and'\
  'the shelter does not qualify as a tier II.  Clusters are a special agreement'\
  'with providers where providers acquire units for sheltering that are in'\
  'standard residential buildings, where the buildings typically already have'\
  'private tenants.  Buildings may be in close proximity or they may be disbursed. '\
  'Mayor DeBlasio is phasing out the cluster program over the next three years.'
)
ShelterType.create!(
  name: 'Tier 2',
  description: 'An apartment-style facility with a cooking space and a bathroom'\
  ' for each family.  Tier II shelters may be an institutional shelter setting '\
  'with private rooms offering three meals a day and/or cooking apparatus, as '\
  'well as enhanced social services.'
)
programs = [
  'Adult Commercial Hotel',
  'Annex',
  'Assessment',
  'Criminal Justice',
  'Diversion',
  'Employment',
  'General',
  'Mental Health',
  'MICA',
  'Special Population',
  'Substance Abuse',
  'Young Adult'
]
programs.each { |program| ProgramType.create!(name: program) }
