class MockGithubService
  def get_payload_commit(sha = nil)
    {:sha=>"9b87f6f880de24cfaad44f9703cf98557c4fe332",
     :commit=>
      {:author=>
        {:name=>"Nick Weiland",
         :email=>"nickweiland@gmail.com",
         :date=>"2016-04-24T22:56:23Z"},
       :committer=>
        {:name=>"Nick Weiland",
         :email=>"nickweiland@gmail.com",
         :date=>"2016-04-24T22:56:23Z"},
       :message=>"test",
        },
     :author=>
      {:login=>"weilandia",
       :id=>13652979,
       :avatar_url=>"https://avatars.githubusercontent.com/u/13652979?v=3",
        },
     :files=>
      [{:sha=>"a1dcb174a517e014fed45aa48e4d149707a0e485",
        :filename=>"app/purgatory_challenges/divinization.rb",
        :status=>"modified",
        :additions=>3,
        :deletions=>0,
        :changes=>3,
        :patch=>
         "@@ -4,13 +4,16 @@ module Divinization\n   extend ActiveSupport::Concern\n \n   def unique_merchant_ids\n+    \"test\"\n   end\n \n   class_methods do\n     def pluck_first_names\n+      \"test\"\n     end\n \n     def pluck_last_names_in_reverse_alphabetical_order\n+      \"test\"\n     end\n   end\n end"
        }
      ]
    }
  end

  def get_file_contents(file, sha)
    {:name=>"divinization.rb",
     :path=>"app/purgatory_challenges/divinization.rb",
     :sha=>"a1dcb174a517e014fed45aa48e4d149707a0e485",
     :content=>
      "cmVxdWlyZSAnYWN0aXZlX3N1cHBvcnQvY29uY2VybicKbW9kdWxlIERpdmlu\naXphdGlvbgogIExFVkVMID0gMQogIGV4dGVuZCBBY3RpdmVTdXBwb3J0OjpD\nb25jZXJuCgogIGRlZiB1bmlxdWVfbWVyY2hhbnRfaWRzCiAgICAidGVzdCIK\nICBlbmQKCiAgY2xhc3NfbWV0aG9kcyBkbwogICAgZGVmIHBsdWNrX2ZpcnN0\nX25hbWVzCiAgICAgICJ0ZXN0IgogICAgZW5kCgogICAgZGVmIHBsdWNrX2xh\nc3RfbmFtZXNfaW5fcmV2ZXJzZV9hbHBoYWJldGljYWxfb3JkZXIKICAgICAg\nInRlc3QiCiAgICBlbmQKICBlbmQKZW5kCg==\n"
    }
  end
end
