module PeopleHelper
  def has_role?
    logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    logger.debug current_page?('/students') || current_page?('/teachers')
    logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    return current_page?('/students') || current_page?('/teachers')
  end

  def get_role
    if has_role?
      if current_page?('/students')
        return :Student
      else
        return :Teacher
      end
    end
  end
end
