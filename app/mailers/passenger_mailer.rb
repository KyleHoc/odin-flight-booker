class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def confirmation_email
        @passenger = params[:passenger]
        @url  = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Your Booking is Confirmed')
    end
end
