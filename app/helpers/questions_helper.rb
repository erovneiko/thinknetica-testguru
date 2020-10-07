module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create new question in test \"#{question.test.title}\":"
    else
      "Edit question in test \"#{question.test.title}\":"
    end
  end

  def text_with_index(question, index)
    sanitize index.to_s + '. ' + question.text.gsub("<pre>", "\n<pre>\n")
                                              .gsub("</pre>", "\n</pre>")
                                              .gsub("\\n", "\n")
  end
end
