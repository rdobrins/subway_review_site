class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

      mail(
        to: review.station.user.email,
        subject: "New Review for #{review.station.name}"
      )
  end
end
