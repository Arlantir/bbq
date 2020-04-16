class NotifyJob < ApplicationJob
  queue_as :default

  def perform(object)
    event = object.event

    emails = (event.subscribers.map(&:email) + [event.user.email] - [object.user&.email]).uniq

    case object
    when Comment
      emails.each do |mail|
        EventMailer.comment(event, object, mail).deliver_later
      end
    when Photo
      emails.each do |mail|
        EventMailer.photo(event, object, mail).deliver_later
      end
    end
  end
end
