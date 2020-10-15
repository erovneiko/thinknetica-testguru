module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "New Question in Test \"#{question.test.title}\""
    else
      "Edit Question in Test \"#{question.test.title}\""
    end
  end

  def question_text(question)
    sanitize question.text.gsub("<pre>", "\n<pre>\n").gsub("</pre>", "\n</pre>").gsub("\\n", "\n")
  end
end
