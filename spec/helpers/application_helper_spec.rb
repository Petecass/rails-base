# frozen_string_literal: true
require 'rails_helper'

describe ApplicationHelper do
  describe '#main_nav_link' do
    context 'with no default options' do
      subject { helper.main_nav_link('hello', root_path) }
      it 'returns a nav link' do
        expect(subject).to eq '<a class="item " href="/">hello</a>'
      end
    end

    context 'with extra options' do
      subject { helper.main_nav_link('hello', root_path, method: :delete) }
      it 'returns a nav link with extra data' do
        expect(subject).to eq '<a class="item " rel="nofollow" data-method="delete" href="/">hello</a>'
      end
    end
  end

  describe '#default_meta_tags' do
    it 'returns a hash' do
      expect(helper.default_meta_tags[:site]).to eq I18n.t('meta.default.site')
    end
  end
end
