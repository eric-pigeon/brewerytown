require 'spec_helper'

describe Brewerytown do

  class Yuengling
    include Brewerytown::Brewable
  end

  let(:lager) do
    Yuengling
  end

  describe ".brew_ingredients" do

    it "defines brew_ingredients" do
      expect(lager).to respond_to(:brew_ingredients)
    end

    context "when setting ingredients" do
      before do
        lager.brew_ingredients(:water, :barley, :hops, :yeast)
      end

      it "has ingedients" do
        expect(lager.ingredients).to_not be_empty
      end
    end
  end

  context "#add_ingredient" do
    class YuenglingLager
      include Brewerytown::Brewable

      brew_ingredients(:water, :barley, :hops, :yeast)
    end

    let(:current_batch) do
      YuenglingLager.new
    end

    it "rejects bad ingredients" do
      expect {current_batch.add_ingredient(:salt)}.to raise_exception
    end

    it "accepts good ingredients" do
      current_batch.add_ingredient(:water)
      current_batch.add_ingredient(:barley)
      current_batch.add_ingredient(:hops)
      current_batch.add_ingredient(:yeast)
      expect(current_batch.current_ingredients).to include(:water)
      expect(current_batch.current_ingredients).to include(:barley)
      expect(current_batch.current_ingredients).to include(:hops)
      expect(current_batch.current_ingredients).to include(:yeast)
    end

    it "rejects duplicate ingredients" do
      current_batch.add_ingredient(:water)
      expect {current_batch.add_ingredient(:water)}.to raise_exception
    end
  end

  context "#is_ready?" do
    class PabstBlueRibbon
      include Brewerytown::Brewable

      brew_ingredients(:water, :barley, :hops, :yeast, :sewage)
    end

    let(:pbr) do
      PabstBlueRibbon.new
    end

    it "returns false without all ingredients" do
      pbr.add_ingredient(:water)
      expect(pbr.is_ready?).to eq(false)
    end

    it "is ready with all ingredients" do
      pbr.add_ingredient(:water)
      pbr.add_ingredient(:hops)
      pbr.add_ingredient(:barley)
      pbr.add_ingredient(:yeast)
      pbr.add_ingredient(:sewage)
      expect(pbr.is_ready?).to eq(true)
    end
  end

end
