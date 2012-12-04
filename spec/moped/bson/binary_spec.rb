# encoding: utf-8

require "spec_helper"

describe Moped::BSON::Binary do
  let(:uuid) { "C57B2FA6-4B70-0001-D938-308018C0141B" }

  describe(':uuid') do
    it("can be instantiated") do
      bin_uuid = Moped::BSON::Binary.new(:uuid, uuid)
      bin_uuid.data.should == uuid
    end

    it("can be serialized and unserialized") do
      expected = Moped::BSON::Document.new
      expected['uuid'] = Moped::BSON::Binary.new(:uuid, uuid)
      data = Moped::BSON::Document.serialize(expected)
      actual = Moped::BSON::Document.deserialize(StringIO.new(data))
      actual['uuid'].should_not(be_nil, actual.inspect)
      actual['uuid'].data.should == uuid
    end
  end
end