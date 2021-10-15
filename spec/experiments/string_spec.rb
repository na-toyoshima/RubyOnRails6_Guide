require "spec_helper"

describe String do
    describe "#<<" do
        example "add a character" do
            s = "ABC"
            s << "D"
            expect(s.size).to eq(4)
        end

        it "cant append nil", :exception do
            s = "ABC"
            expect {s << nil}.to raise_error(TypeError)
        end
    end
end