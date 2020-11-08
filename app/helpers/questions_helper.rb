module QuestionsHelper
  def question_header(question)
    if question.new_record?
      I18n.t('admin.questions.new.header', title: question.test.title)
    else
      I18n.t('admin.questions.edit.header', title: question.test.title)
    end
  end

  def question_text(question)
    sanitize question.text.gsub("<pre>", "\n<pre>\n").gsub("</pre>", "\n</pre>").gsub("\\n", "\n")
  end
end
