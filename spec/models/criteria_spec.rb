require 'spec_helper'

describe Mongoid::Criteria do

  describe '#add_filter' do

    let!(:users) do
      FactoryGirl.create :user, :name => 'Name1'
      FactoryGirl.create :user, :name => 'Name2'
      FactoryGirl.create :user, :name => 'Name3'
    end

    context 'without additional order' do

      it 'applies callback' do
        names_order = %w(Name3 Name1 Name2)
        criteria = User.all.add_filter do |users|
          users = users.to_a
          names_order.map do |name|
            users.select { |user| user.name == name }.first
          end
        end
        expect(criteria.to_a.map(&:name)).to eq(names_order)
      end

    end

    context 'with additional order' do

      it 'does not apply callback' do
        names_order = %w(Name3 Name1 Name2)
        criteria = User.order_by(:name => :desc).add_filter do |users|
          users = users.to_a
          names_order.map do |name|
            users.select { |user| user.name == name }.first
          end
        end
        expect(criteria.to_a.map(&:name)).to eq(%w(Name3 Name2 Name1))
      end

    end

  end

end