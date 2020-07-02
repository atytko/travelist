require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'validation tests' do
    it 'ensures city presence' do
      note = Note.new(city: nil).save
      expect(note).to eq(false)
    end

    it 'ensures message presence' do
      note = Note.new(message: nil).save
      expect(note).to eq(false)
    end

    it 'should save successfully' do
      note = Note.new(city: 'Warsaw', message: 'nice trip!').save
      expect(note).to eq(true)
    end
  end
  context 'scope tests' do
    let(:params) { { message: 'Nice trip.' } }
    before(:each) do
      Note.new(params.merge(city: 'Lisbon')).save
      Note.new(params.merge(city: 'Tokyo')).save
      Note.new(params.merge(city: 'Krakow')).save
      Note.new(params.merge(city: 'Paris')).save
      Note.new(params.merge(city: 'Paris')).save
      Note.new(params.merge(city: 'London')).save
      Note.new(params.merge(city: 'Amsterdam')).save
      Note.new(params.merge(city: 'London')).save
      Note.new(params.merge(city: 'Berlin')).save
      Note.new(params.merge(city: 'Los Angeles')).save
      Note.new(params.merge(city: 'Los Angeles')).save
    end

    it 'should return duplicate cities' do 
      duplicateNotes = Note.select(:city).group(:city).having("count(*) > 1").size.sum { |e| e[1] }
      expect(duplicateNotes).to eq(6)
    end

    it 'should return unique cities' do
      expect(Note.distinct.count('city')).to eq(8)
    end
  end
end