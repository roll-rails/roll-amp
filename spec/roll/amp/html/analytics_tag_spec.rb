require 'spec_helper'

RSpec.describe Roll::Amp::Html::AnalyticsTag do
  def create(type, content)
    Roll::Amp::Html::AnalyticsTag.new(type, content)
  end

  def expect_tag(type, content)
    html = create(type, content).to_html
    expected = expect(html)
    expected.to have_tag("amp-analytics[type=\"#{type}\"]", text: content)
  end

  context 'when initialization parameters are invalid' do
    it 'initializes without error' do
      expect { create(nil, nil) }.not_to raise_error
      expect { create(nil, '') }.not_to raise_error
      expect { create('', nil) }.not_to raise_error
      expect { create('', '') }.not_to raise_error
    end
  end

  context 'when empty parameters are specified' do
    it 'prints empty analytics tag' do
      html = create('', '').to_html
      expect(html).to have_tag('amp-analytics[type=""]', text: '')
    end
  end

  context 'when type and content are specified' do
    let(:type) { 'googleanalytics' }
    let(:content) { '{}' }

    it 'prints analytics tag with the specified type and content' do
      expect_tag(type, '')
      expect_tag(type, content)
      expect_tag('', content)
    end
  end
end
