require 'rails_helper'

RSpec.describe Floor, type: :model do
  it 'has a program type' do
    floor = Floor.new
    program = ProgramType.new(name: 'Substance Abuse')
    floor.program_type = program
    expect(floor.program_type).to be(program)
  end
end
