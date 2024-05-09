require_relative "../lib/gabby_prompt"
require "pathname"
require "tmpdir"

describe GabbyPrompt do 
  it "has a nice arrow" do
    expect(subject.arrow).to eq("\e[32m>\e[0m")
  end

  it "shows you what directory you are in" do
     Dir.mktmpdir do | dir | 
       Dir.chdir(dir) do 
         realpath = Pathname.new(dir).realpath.to_s
         expect(subject.directory_position).to eq(realpath)
       end
    end
  end

  it "shows you the git branch" do
   Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        # Initialize a Git repository
        `git init`

        # Create a test file
        File.open("test.txt", "w") { |file| file.write("This is a test file.") }

        # Add and commit the test file
        `git add .`
        `git commit -m "Initial commit"`

        # Switch to a new branch
        `git checkout -b test-branch`

        # Expect the GabbyPrompt object to display the correct Git branch
        expect(subject.git_branch).to eq("test-branch")
      end
   end
  end

  it "shows you '*' if there are uncommited changes" do 
    Dir.mktmpdir do | dir|
      Dir.chdir(dir) do

        `git init`

        # Create a test file
        File.open("test.txt", "w") { |file| file.write("This is a test file.") }

        # Add and commit the test file
        `git add .`
        `git commit -m "Initial commit"`

        File.open("test.txt", "a") {|file| file.write("Extra changes") }
        expect(subject.uncommitted_changes?).to eq('*') 
      end
    end
  end

  it "renders the whole prompt" do
  expect(subject.prompt).to include(subject.directory_position)
  expect(subject.prompt).to include(subject.git_branch)
  expect(subject.prompt).to include(subject.arrow)
  end
 
end
