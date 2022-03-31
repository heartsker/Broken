# typed: false
# frozen_string_literal: true

require "livecheck/strategy"
require "bundle_version"

describe Homebrew::Livecheck::Strategy::ExtractPlist do
  subject(:extract_plist) { described_class }

  let(:http_url) { "https://brew.sh/blog/" }
  let(:non_http_url) { "ftp://brew.sh/" }

  let(:items) do
    {
      "first"  => extract_plist::Item.new(
        bundle_version: Homebrew::BundleVersion.new(nil, "1.2"),
      ),
      "second" => extract_plist::Item.new(
        bundle_version: Homebrew::BundleVersion.new(nil, "1.2.3"),
      ),
    }
  end

  let(:multipart_items) do
    {
      "first"  => extract_plist::Item.new(
        bundle_version: Homebrew::BundleVersion.new(nil, "1.2.3-45"),
      ),
      "second" => extract_plist::Item.new(
        bundle_version: Homebrew::BundleVersion.new(nil, "1.2.3-45-abcdef"),
      ),
    }
  end
  let(:multipart_regex) { /^v?(\d+(?:\.\d+)+)(?:[._-](\d+))?(?:[._-]([0-9a-f]+))?$/i }

  let(:versions) { ["1.2", "1.2.3"] }
  let(:multipart_versions) { ["1.2.3,45", "1.2.3,45,abcdef"] }

  describe "::match?" do
    it "returns true for an HTTP URL" do
      expect(extract_plist.match?(http_url)).to be true
    end

    it "returns false for a non-HTTP URL" do
      expect(extract_plist.match?(non_http_url)).to be false
    end
  end

  describe "::versions_from_items" do
    it "returns an empty array if Items hash is empty" do
      expect(extract_plist.versions_from_items({})).to eq([])
    end

    it "returns an array of version strings when given Items" do
      expect(extract_plist.versions_from_items(items)).to eq(versions)
    end

    it "returns an array of version strings when given Items and a block" do
      # Returning a string from block
      expect(
        extract_plist.versions_from_items(items) do |items|
          items["first"].version
        end,
      ).to eq(["1.2"])

      # Returning an array of strings from block
      expect(
        extract_plist.versions_from_items(items) do |items|
          items.map do |_key, item|
            item.bundle_version.nice_version
          end
        end,
      ).to eq(versions)
    end

    it "returns an array of version strings when given Items, a regex, and a block" do
      # Returning a string from block
      expect(
        extract_plist.versions_from_items(multipart_items, multipart_regex) do |items, regex|
          match = items["first"].version.match(regex)
          next if match.blank?

          match[1..].compact.join(",")
        end,
      ).to eq(["1.2.3,45"])

      # Returning an array of strings from block
      expect(
        extract_plist.versions_from_items(multipart_items, multipart_regex) do |items, regex|
          items.map do |_key, item|
            match = item.version.match(regex)
            next if match.blank?

            match[1..].compact.join(",")
          end
        end,
      ).to eq(multipart_versions)
    end

    it "allows a nil return from a block" do
      expect(extract_plist.versions_from_items(items) { next }).to eq([])
    end

    it "errors on an invalid return type from a block" do
      expect { extract_plist.versions_from_items(items) { 123 } }
        .to raise_error(TypeError, Homebrew::Livecheck::Strategy::INVALID_BLOCK_RETURN_VALUE_MSG)
    end
  end
end
