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

  describe 'passed, pending and failed' do

    describe 'example_passed' do

      it 'should call the increment method' do

        @formatter.start_dump
        @formatter.dump_summary(0.00001, 2, 0, 0)

        puts @output.string

      end

    end

  end

end