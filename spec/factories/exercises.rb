FactoryGirl.define do
  factory :exercise do
    name "exercise"
    spec "this is a spec LEVEL = 1"
    encoded_spec "cmVxdWlyZSAncmFpbHNfaGVscGV"
    spec_path "app/purgatory_challenges/_spec/exercise_spec.rb"
    solution_frame "this is a solution frame"
    encoded_solution_frame "cmVxdWlyZSAncmFpbHNfaGVscGV"
    solution_frame_path "app/purgatory_challenges/exercise.rb"
    level 1
  end

  factory :exercise_divinization, parent: :exercise do
    name "divinization"
    spec "require 'rails_helper'\nRSpec.describe Customer, type: :model do\n  context \"divinization\" do\n    customers = [\"Joey\", \"Cecelia\", \"Mariah\", \"Leanne\", \"Sylvester\", \"Heber\", \"Parker\", \"Loyal\", \"Dejon\", \"Ramona\"]\n    xit \"can pluck first_names\" do\n      expect(Customer.pluck_first_names.take(10)).to eq(customers)\n    end\n\n    xit \"can pluck last_names in reverse alphabetical order\" do\n      customers = [\"Zulauf\", \"Zulauf\", \"Zulauf\", \"Zulauf\", \"Zulauf\", \"Zieme\", \"Zieme\", \"Zieme\", \"Zieme\", \"Zieme\"]\n\n      expect(Customer.pluck_last_names_in_reverse_alphabetical_order.take(10)).to eq(customers)\n    end\n\n    xit \"can pluck a customer's unique merchant ids via invoices\" do\n      merchant_ids = [79, 91, 18, 86, 28, 63, 99, 1]\n      expect(Customer.find(7).unique_merchant_ids).to eq(merchant_ids)\n    end\n  end\nend\n"
    encoded_spec "cmVxdWlyZSAncmFpbHNfaGVscGVyJwpSU3BlYy5kZXNjcmliZSBDdXN0b21l\nciwgdHlwZTogOm1vZGVsIGRvCiAgY29udGV4dCAiZGl2aW5pemF0aW9uIiBk\nbwogICAgY3VzdG9tZXJzID0gWyJKb2V5IiwgIkNlY2VsaWEiLCAiTWFyaWFo\nIiwgIkxlYW5uZSIsICJTeWx2ZXN0ZXIiLCAiSGViZXIiLCAiUGFya2VyIiwg\nIkxveWFsIiwgIkRlam9uIiwgIlJhbW9uYSJdCiAgICB4aXQgImNhbiBwbHVj\nayBmaXJzdF9uYW1lcyIgZG8KICAgICAgZXhwZWN0KEN1c3RvbWVyLnBsdWNr\nX2ZpcnN0X25hbWVzLnRha2UoMTApKS50byBlcShjdXN0b21lcnMpCiAgICBl\nbmQKCiAgICB4aXQgImNhbiBwbHVjayBsYXN0X25hbWVzIGluIHJldmVyc2Ug\nYWxwaGFiZXRpY2FsIG9yZGVyIiBkbwogICAgICBjdXN0b21lcnMgPSBbIlp1\nbGF1ZiIsICJadWxhdWYiLCAiWnVsYXVmIiwgIlp1bGF1ZiIsICJadWxhdWYi\nLCAiWmllbWUiLCAiWmllbWUiLCAiWmllbWUiLCAiWmllbWUiLCAiWmllbWUi\nXQoKICAgICAgZXhwZWN0KEN1c3RvbWVyLnBsdWNrX2xhc3RfbmFtZXNfaW5f\ncmV2ZXJzZV9hbHBoYWJldGljYWxfb3JkZXIudGFrZSgxMCkpLnRvIGVxKGN1\nc3RvbWVycykKICAgIGVuZAoKICAgIHhpdCAiY2FuIHBsdWNrIGEgY3VzdG9t\nZXIncyB1bmlxdWUgbWVyY2hhbnQgaWRzIHZpYSBpbnZvaWNlcyIgZG8KICAg\nICAgbWVyY2hhbnRfaWRzID0gWzc5LCA5MSwgMTgsIDg2LCAyOCwgNjMsIDk5\nLCAxXQogICAgICBleHBlY3QoQ3VzdG9tZXIuZmluZCg3KS51bmlxdWVfbWVy\nY2hhbnRfaWRzKS50byBlcShtZXJjaGFudF9pZHMpCiAgICBlbmQKICBlbmQK\nZW5kCg==\n"
    spec_path "app/purgatory_challenges/_spec/divinization_spec.rb"
    solution_frame "require 'active_support/concern'\nmodule Divinization\n  LEVEL = 1\n  extend ActiveSupport::Concern\n\n  def unique_merchant_ids\n  end\n\n  class_methods do\n    def pluck_first_names\n    end\n\n    def pluck_last_names_in_reverse_alphabetical_order\n    end\n  end\nend\n"
    encoded_solution_frame "cmVxdWlyZSAnYWN0aXZlX3N1cHBvcnQvY29uY2VybicKbW9kdWxlIERpdmlu\naXphdGlvbgogIExFVkVMID0gMQogIGV4dGVuZCBBY3RpdmVTdXBwb3J0OjpD\nb25jZXJuCgogIGRlZiB1bmlxdWVfbWVyY2hhbnRfaWRzCiAgZW5kCgogIGNs\nYXNzX21ldGhvZHMgZG8KICAgIGRlZiBwbHVja19maXJzdF9uYW1lcwogICAg\nZW5kCgogICAgZGVmIHBsdWNrX2xhc3RfbmFtZXNfaW5fcmV2ZXJzZV9hbHBo\nYWJldGljYWxfb3JkZXIKICAgIGVuZAogIGVuZAplbmQK\n"
    solution_frame_path "app/purgatory_challenges/divinization.rb"
    level 1
  end
end
