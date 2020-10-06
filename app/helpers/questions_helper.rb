module QuestionsHelper
  FORM_HEADER = { new: "Create new question in test \"&\":",
                  edit: "Edit question in test \"&\":" }.freeze

  def question_header(type, test)
    '<b>' + FORM_HEADER[type].sub('&', test.title) + '</b><br><br>'
  end
end
