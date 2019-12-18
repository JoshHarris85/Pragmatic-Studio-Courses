require 'crowdfund/project'

module FundRaiser
  describe Project do
    before do
      @initial_funding = 100
      @target_funding = 200
      @project = Project.new('test', @initial_funding, @target_funding)
    end

    it 'has an initial target funding amount' do
      expect(@project.target_fund).to eq(200)
    end

    it 'computes the total funding outstanding as the target funding amount minus the funding amount' do
      expect(@project.funding_needed).to eq(@target_funding - @initial_funding)
    end

    it 'increases funds by 25 when funds are added' do
      @project.add_funds(25)

      expect(@project.current_fund).to eq(25 + @initial_funding)
    end

    it 'decreases funds by 15 when funds are removed' do
      @project.remove_funds(15)

      expect(@project.current_fund).to eq(@initial_funding - 15)
    end

    context 'defaults on a project' do
      before do
        @project = Project.new('test')
      end

      it 'has a default current_fund of 0 for funding amount' do
        expect(@project.current_fund).to eq(0)
      end

      it 'has a default target_fund of 0 for funding amount' do
        expect(@project.target_fund).to eq(0)
      end
    end

    context 'a project is funded' do
      before do
        @project = Project.new('test', 10, 10)
      end

      it 'is funded' do
        expect(@project).to be_funded
      end
    end

    context 'a project is not funded' do
      before do
        @project = Project.new('test', 10, 100)
      end

      it 'is not funded' do
        expect(@project).to_not be_funded
      end
    end
  end
end
