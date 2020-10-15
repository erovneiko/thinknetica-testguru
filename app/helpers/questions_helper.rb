module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "New question in test \"#{question.test.title}\""
    else
      "Edit question in test \"#{question.test.title}\""
    end
  end

  def question_text(question)
    sanitize question.text.gsub("<pre>", "\n<pre>\n").gsub("</pre>", "\n</pre>").gsub("\\n", "\n")
  end
end
