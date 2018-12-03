# frozen_string_literal: true

require 'rails_helper'

describe Category, type: :model do
  subject(:category) { create(:category) }

  context 'validation' do
    it 'should be invalid without an name' do
      expect(build(:category, name: nil)).not_to be_valid
    end

    it 'should be invalid with name less 3 symbols' do
      expect(build(:category, name: 'ca')).not_to be_valid
    end

    it 'should be invalid with more 15 symbols' do
      expect(build(:category, name: 'categoryName_categoryName')).not_to be_valid
    end
  end

  context 'association' do
    it 'has many images' do
      respond_to :images
    end

    it 'has many follows(polymorphic)' do
      respond_to :followable
    end

    it 'belongs_to user' do
      respond_to :user
    end

    it 'belongs_to image(for preview)' do
      respond_to :image
    end
  end

  context 'counter cache' do
    describe 'images counter' do
      let(:category_images) { create(:category_with_images) }

      it 'should be equal 3' do
        expect(category_images.images_count).to eq 3
      end
    end

    describe 'follows counter' do
      let(:category_follows) { create(:category_with_follows) }

      it 'should be equal 3' do
        expect(category_follows.follows_count).to eq 3
      end
    end
  end
end