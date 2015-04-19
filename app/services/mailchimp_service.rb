class MailchimpService

  attr_reader :double_optin, :email, :exceptions, :list, :mailchimp

  def initialize(args)
    args = defaults.merge(args)
    @double_optin = args[:double_optin]
    @email = args[:email]
    @exceptions = args[:exceptions]
    @list = args[:list]
    @mailchimp = connect
  end

  def subscribe
    mailchimp.lists.subscribe({id: list, email: {email: email}, double_optin: double_optin})
  end

  private

  def connect
    Gibbon::API.api_key = ENV['MAILCHIMP_API_KEY']
    Gibbon::API.timeout = 15
    Gibbon::API.throws_exceptions = exceptions
    Gibbon::API.new
  end

  def defaults
    {double_optin: false, exceptions: false, list: ENV['MAILCHIMP_DEFAULT_LIST']}
  end
end
