require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:event) { FactoryBot.build_stubbed(:event) }

  # объект тестирования (политика)
  subject { EventPolicy }

  context 'when the user is anonymous' do
    # аноним может видеть события
    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end

    # аноним ничерта не может
    permissions :create?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context 'when there is a user' do
    let(:user) { FactoryBot.build_stubbed(:user) }

    # залогиненый юзер может видеть события и создавать новые
    permissions :show?, :create?do
      it { is_expected.to permit(user, event) }
    end

    # залогиненый юзер не может редактировать чужое событие
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'when user in an owner' do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:event) { FactoryBot.build_stubbed(:event, user: user) }

    # юзер создал событие и может его видеть и редактировать
    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
