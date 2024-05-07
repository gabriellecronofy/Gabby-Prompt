class GabbyPrompt
  def arrow
   ">" 
  end
  
  def prompt
    array_of_git_and_dir = [ ]
    array_of_git_and_dir << directory_position
    array_of_git_and_dir << git_branch 
    array_of_git_and_dir 
    arrow
  end
  def directory_position
    Dir.pwd
  end

  def git_branch
     branch = `git rev-parse --abbrev-ref HEAD`.chomp
    branch
  end
end
