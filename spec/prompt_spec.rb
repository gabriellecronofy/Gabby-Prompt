require_relative "../lib/gabby_prompt"
require "pathname"
require "tmpdir"

describe GabbyPrompt do 
  it "has a nice arrow" do
    expect(subject.arrow).to end_with(">")
  end
  it "shows you what directory you are in" do
     Dir.mktmpdir do | dir | 
       Dir.chdir(dir) do 
         realpath = Pathname.new(dir).realpath.to_s
         expect(subject.directory_position).to eq(realpath)
       end
    end
    
  end
  it "shows you the git branch"
  it "renders the whole prompt" do
    expect(subject.prompt).to end_with(">")
  end
end
