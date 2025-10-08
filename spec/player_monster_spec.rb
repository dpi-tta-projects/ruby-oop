# spec/player_monster_spec.rb

RSpec.describe "player_monster.rb" do
  describe "output" do
    it "prints Player and Monster attack lines", points: 3 do
      output = run_script_and_capture_lines("player_monster.rb")

      expect(output).to include("Player attacks with sword!")
      expect(output).to include("Monster attacks with claws!")
    end

    it "prints both lines in order", points: 1 do
      output = run_script_and_capture_lines("player_monster.rb")
      joined = output.join(" ")
      expect(joined).to match(/Player attacks with sword!.*Monster attacks with claws!/),
        "Expected Player attack to print before Monster attack."
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("player_monster.rb")) }

    it "defines both Player and Monster classes", points: 2 do
      expect(source_code).to match(/class\s+Player/),
        "Expected to define a Player class."
      expect(source_code).to match(/class\s+Monster/),
        "Expected to define a Monster class."
    end

    it "defines attack methods in both classes", points: 2 do
      expect(source_code.scan(/def\s+attack/).count).to be >= 2,
        "Expected each class to define its own attack method."
    end

    it "loops over both objects using each", points: 2 do
      expect(source_code).to match(/\.each\s+do\s+\|/),
        "Expected to loop over an array using .each."
    end

    it "does not hard-code the final output strings directly in puts", points: 2 do
      expect(source_code).not_to match(/puts\s+["']Player attacks with sword!["']/),
        "Don't hard-code the Player attack string directly in puts; return it from #attack."
      expect(source_code).not_to match(/puts\s+["']Monster attacks with claws!["']/),
        "Don't hard-code the Monster attack string directly in puts; return it from #attack."
    end
  end
end
