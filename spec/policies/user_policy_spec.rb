# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :model do
  subject { described_class }

  let!(:admin) { create(:user, :admin) }

  permissions :index?, :destroy? do
    it 'allows an admin to see and destroy' do
      expect(subject).to permit(admin)
    end
  end
end
