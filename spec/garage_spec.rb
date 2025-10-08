require "spec_helper"

RSpec.describe "garage.rb" do
  describe "output" do
    it "lists cars stored in the garage", points: 3 do
      output = run_script_and_capture_lines("garage.rb")
      expect(output.first).to eq("Cars in garage:")
      expect(output).to include("- Toyota", "- Honda")
    end
  end

  describe "code" do
    let(:source) { strip_comments(File.read("garage.rb")) }

    it "defines Car and Garage classes", points: 2 do
      expect(source).to match(/class\s+Car/)
      expect(source).to match(/class\s+Garage/)
    end

    it "uses an array to store Car objects", points: 2 do
      expect(source).to match(/@\w+\s*=\s*\[/)
    end

    it "uses iteration to print car models", points: 2 do
      expect(source).to match(/\.each/)
    end
  end
end
