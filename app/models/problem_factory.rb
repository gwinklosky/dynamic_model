class ProblemFactory
  @@problem_classes = {}

  def self.problem_class(prefix)
    if @@problem_classes[prefix].nil?
      @@problem_classes[prefix] = build_problem_classes(prefix)
    end
    @@problem_classes[prefix]
  end

  def self.build_problem_classes(prefix)
    #create the solution class as well
    solution_def = "class #{prefix.capitalize}Solution < ActiveRecord::Base;"+
      " self.table_name = '#{prefix}_solutions';"+
      " validates :explanation, presence: true;"+
      " include AbstractSolution;"+
      "end"
    puts "about to eval #{solution_def}"
    eval(solution_def)

    problem_def = "class #{prefix.capitalize}Problem < ActiveRecord::Base;"+
      " self.table_name = '#{prefix}_problems';"+
      "   validates :title, presence: true;"+
      "   validates :description, presence: true;"+
      " validates :severity, numericality: { greater_than: 0, less_than: 11};"+
      " has_many :#{prefix}_solutions;"+
      "end"
    puts "about to eval #{problem_def}"
    eval(problem_def)
    klass = eval("#{prefix.capitalize}Problem")
    puts "returning klass #{klass}"
    klass
  end
  
  def self.solution_class(prefix)
    class_text = "#{prefix.capitalize}Solution"
    puts "about to eval #{class_text}"
    klass = eval("#{prefix.capitalize}Solution")
    puts "returned #{klass}"
    klass
  end
end