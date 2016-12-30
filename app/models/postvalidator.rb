class PostValidator < ActiveModel::Validator

  def validate(record)

    return record.errors[:title] << false if record.title.nil?

    clickbait = ["Won't Believe", "Secret", "Guess"]

    if record.title.include?("Top")
      index = record.title.split.index("Top")
      if record.title.split[index + 1].is_a?(Integer)
        return true
      end
    end

    clickbait.each do |word|
      if record.title.include?(word)
        return true
      end
    end

    record.errors[:title] << false
  end



end
