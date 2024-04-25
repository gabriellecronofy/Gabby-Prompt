require_relative "../lib/gabby_prompt"

describe GabbyPrompt do 
  it "has a nice arrow" do
    expect(subject.arrow).to end_with(">")
  end
  it "shows you what directory you are in"
  it "shows you the git branch"
end
