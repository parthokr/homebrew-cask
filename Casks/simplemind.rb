cask "simplemind" do
  version "2.0.0,b2619"
  sha256 "741acb49412f72c9da7eba8c174983d6d8bd9ed4d56856dbaf8f7a0092ed99b8"

  url "https://simpleapps.eu/simplemind/SM2Mac_G7Ynr4BfJYzhbHtCCTr/SimpleMindMacOS#{version.csv.first.no_dots}#{version.csv.second}.dmg"
  name "SimpleMind"
  desc "Cross-platform Mind Mapping tool"
  homepage "https://simpleapps.eu/"

  livecheck do
    url "https://simpleapps.eu/download/full-edition/simplemind-pro-mac/"
    strategy :page_match do |page|
      match = page.match(%r{<b>Version: ([\d.]+) ([a-zA-Z0-9]+)</b>}i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "SimpleMind Pro.app"

  zap trash: [
    "~/Library/Caches/com.modelmakertools.simplemindosx",
    "~/Library/Preferences/com.modelmakertools.simplemindosx.plist",
  ]
end
