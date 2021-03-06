require 'rails_helper'

RSpec.describe Inventory::InventoryItem, type: :model do
  describe '#supplier_sku' do
    pending 'Nothing todo now.'
  end

  describe '#display_name' do
    it { should validate_presence_of(:display_name) }
  end

  describe '#restock_item' do
    before(:each) do
      @default_facility_type = create :default_facility_type
      @default_facility = create :default_facility
      @item_record = create :inventory_inventory_item
    end
    context 'When not found any Lots in stock' do
      it 'should empty :item_lots' do
        expect(@item_record.item_lots).to be_empty
      end

      it 'should create new :item_lots' do
        @item_record.restock('TEST-LOT-NUMBER', 1000, 20.00, 1.year.ago, Date.today)
        expect(@item_record.item_lots.count).to eq(1)
        expect(@item_record.item_lots.first.lot_number).to eq('TEST-LOT-NUMBER')
      end
    end
  end

  describe 'Associations' do
    describe '#supplier' do
      it { should belong_to(:supplier).class_name('Supplier::Supplier').with_foreign_key(:supplier_supplier_id) }
    end

    describe '#item_lots' do
      it { should have_many(:item_lots).class_name('Inventory::ItemLot').with_foreign_key(:inventory_inventory_item_id).dependent(:restrict_with_exception) }
    end

    describe '#countable_unit' do
      context 'when create new :inventory_inventory_item' do
        before(:each) do
          @countable_unit_record = build :inventory_countable_unit
          @item_record = build :inventory_inventory_item, inventory_countable_unit: @countable_unit_record
        end

        it 'should has one :inventory_countable_unit' do
          expect(@item_record.inventory_countable_unit).to eq(@countable_unit_record)
        end
      end
    end
  end
end
