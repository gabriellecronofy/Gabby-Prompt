class GabbyPrompt
  def arrow
  "\e[32m>\e[0m"
  end
  
  def prompt
    array_of_git_and_dir = []
    array_of_git_and_dir << directory_position
    array_of_git_and_dir << git_branch 
    prompt_string = array_of_git_and_dir.join(" ")
    prompt_string += " " + uncommitted_changes? if uncommitted_changes?
    prompt_string + arrow
  end

  def directory_position
    Dir.pwd
  end

  def arrow_direction
    if has_subfolders?
      "↓"
    else
      "↑"
    end
  end

  def has_subfolders?
  end

  def git_branch
    branch = `git rev-parse --abbrev-ref HEAD`.chomp
    branch
  end

  def uncommitted_changes?
    status = `git status --porcelain`
    status.strip.empty? ? '' : '*'
  end
end
