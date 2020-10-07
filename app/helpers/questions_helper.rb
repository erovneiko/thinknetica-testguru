module QuestionsHelper
  FORM_HEADER = { new: "Create new question in test \"&\":",
                  edit: "Edit question in test \"&\":" }.freeze

  def question_header(question)
    header = if question.new_record?
               FORM_HEADER[:new]
             else
               FORM_HEADER[:edit]
             end
    '<b>' + header.sub('&', question.test.title) + '</b><br><br>'
  end

  def text_with_index(question, index)
    sanitize index.to_s + '. ' + question.text.gsub("<pre>", "\n<pre>\n")
                                              .gsub("</pre>", "\n</pre>")
                                              .gsub("\\n", "\n")
  end
end
