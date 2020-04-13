require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.new }

  # объект тестирования (политика)
  subject { EventPolicy }

  context 'when user in not an owner' do
    let(:event) { Event.create(title: 'Шашлыки') }

    # юзер может видеть событие
    permissions :show? do
      it { is_expected.to permit(user, Event) }
      it { is_expected.not_to permit(nil, Event) }
    end

    # если юзеру не принадлежит событие или он не залогинен, то он не может его редактировать
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
      it { is_expected.not_to permit(nil, Event) }
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
