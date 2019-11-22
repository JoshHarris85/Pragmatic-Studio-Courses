require_relative 'fundrequest'
require_relative 'project'

describe FundRequest do
  before do
    $stdout = StringIO.new

    @initial_fund = 50
    @project1 = Project.new('LMN', 50, 3000)
    @project2 = Project.new('XYZ', 50, 75)

    @collection = FundRequest.new('VC-Friendly Start-up Projects')
    @collection.add_project(@project1)
    @collection.add_project(@project2)
  end

  it 'funds the startup if an even number is rolled' do
    allow_any_instance_of(Die).to receive(:roll).and_return(2)

    @collection.request_funding
    expect(@project1.current_fund).to be(@initial_fund + 25)
    expect(@project2.current_fund).to be(@initial_fund + 25)
  end

  it 'removes funds from the startup if an odd number is rolled' do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)

    @collection.request_funding
    expect(@project1.current_fund).to be(@initial_fund - 25)
    expect(@project2.current_fund).to be(@initial_fund - 25)
  end
end
