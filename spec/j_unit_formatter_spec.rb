require 'spec_helper'
require 'stringio'
require 'time'

describe JUnitFormatter do

  before do

    Time.stub!(:now).and_return(Time.utc(2011, 1, 1))

    @output = StringIO.new
    @formatter = JUnitFormatter.new(@output)
    @formatter.start(2)

  end

  describe 'XML format' do

    describe 'summary section' do

      it 'should match the sample for two tests' do

        @formatter.start_dump
        @formatter.dump_summary(0.00001, 2, 0, 0)

        @output.string.should eql('<?xml version="1.0" encoding="UTF-8"?>
<testsuite tests="2" failures="0" errors="0" time="0.000010" timestamp="2011-01-01T00:00:00Z">
  <properties/>
</testsuite>
')
      end

    end

  end

end
