class NewsMailer < ActionMailer::Base
  default from: "sebastien@weblogism.com"

  def update_email(stats)
    @stats = stats

    mail(to: "sebastien@weblogism.com",
         subject: "[HnStats] Latest News")
  end
end
