require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.new }

  # объект тестирования (политика)
  subject { EventPolicy }

  context 'when user in not an owner' do
    let(:event) { Event.create(title: 'Шашлыки') }

    # любые юзеры могу зайти в событие
    permissions :show? do
      it { is_expected.to permit(user, event) }
      it { is_expected.to permit(nil, Event) }
    end

    # только залогиненый юзер может создать событие
    permissions :create? do
      it { is_expected.to permit(user, event) }
      it { is_expected.not_to permit(nil, Event) }
    end

    # залогиненый юзер не может редактировать чужое событие
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, Event) }
    end
  end

  context 'when user in an owner' do
    let(:event) { Event.create(title: 'Шашлыки', user: user) }

    # юзер создал событие и может его видеть и редактировать
    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
