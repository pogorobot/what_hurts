class Baymax
  def ask_what_hurts
    puts "Hello! I am here to assist your well-being."
    beat
    puts "Would you like to assess your current status?"
    return unless consent
    beat
    puts "Let's begin."
    beat
    status = assess_status
    priority = status.first
    puts "I'd like to start with your #{priority[0]} experience."
    beat
    puts "For the next few minutes, let's take a look at your #{priority[0]} well-being."
    beat
    body_scan(priority[0])
    puts "Thank you."
  end

  def assess_status
    ["physical", "mental", "emotional"].each do |status|
    end
    {
      physical: assess("physical"),
      mental: assess("mental"),
      emotional: assess("emotional")
    }.sort_by {|_key, value| value}
  end

  def assess(status)
    lower_bound = rand(100000) - rand(100000)
    upper_bound = rand(100000) + lower_bound
    puts "On a scale of #{lower_bound} to #{upper_bound}, Please rate your #{status} status."
    rating = gets.chomp.to_f
    normalized_rating = (rating - lower_bound) / (upper_bound - lower_bound)
  end

  def body_scan(status)
    areas.each { |area| scan(area, status) }
  end

  def scan(area, status)
    puts "Pay attention to your #{area}."
    beat
    puts "How are you feeling, #{status}ly, in your #{area} right now?"
    gets
  end

  private

  def beat
    sleep 1
  end

  def areas
    [
      "breath",
      "belly",
      "chest",
      "shoulders",
      "neck",
      "face",
      "brow",
      "crown",
      "left arm",
      "left hand",
      "left fingertips",
      "right fingertips",
      "right hand",
      "right arm",
      "lower back",
      "butt",
      "groin",
      "thighs",
      "calves",
      "ankles",
      "foot-arches",
      "heels",
      "toes"
    ]
  end

  def consent
    yes = ["y", "yes", "yup", "affirmative, captain", "uh-huh", "mm-hmm", "aye-aye", "yes, ma'am", "okay", "okey-dokey", "ok", "yes, please", "please", "yeah"]
    answer = gets.chomp.downcase
    puts "Thank you."
    yes.include? answer
  end
end

Baymax.new.ask_what_hurts