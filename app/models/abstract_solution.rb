module AbstractSolution
  def problem
    @problem
  end
  def problem=p
    @problem = p
    problem_id = p.id
  end
end
