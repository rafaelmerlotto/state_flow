class Ticket < ApplicationRecord
  include AASM

  aasm column: 'status' do
    state :new, initial: true
    state :in_progress
    state :waiting_on_customer
    state :resolved
    state :closed

    event :start_progress do
      transitions from: :new, to: :in_progress
    end

    event :wait_for_customer do
      transitions from: :in_progress, to: :waiting_on_customer
    end

    event :resume_work do
      transitions from: :waiting_on_customer, to: :in_progress
    end

    event :resolve do
      transitions from: [:in_progress, :waiting_on_customer], to: :resolved
    end

    event :close do
      transitions from: :resolved, to: :closed
    end
  end
end
