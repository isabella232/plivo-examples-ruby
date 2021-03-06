require 'rubygems'
require 'plivo'
include Plivo

AUTH_ID = "Your AUTH_ID"
AUTH_TOKEN = "Your AUTH_TOKEN"


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Search for new number
params = {
    'country_iso' => 'US', # The ISO code A2 of the country
    'type' => 'local', # The type of number you are looking for. The possible number types are local, national and tollfree.
    'pattern' => '210', # Represents the pattern of the number to be searched. 
    'region' => 'Texas' # This filter is only applicable when the number_type is local. Region based filtering can be performed.
}

response = p.search_phone_number(params)
print response

'''
Sample Output
[200, {
        "api_id"=>"978c324e-b682-11e4-b423-22000ac8a2f8", 
        "meta"=>{
            "limit"=>20, 
            "next"=>"/v1/Account/XXXXXXXXXXXX/PhoneNumber/?limit=20&country_iso=US&pattern=210&region=Texas&offset=20&type=local", 
            "offset"=>0, 
            "previous"=>nil, 
            "total_count"=>98
        }, "objects"=>[
            {
                "country"=>"UNITED STATES", 
                "lata"=>566, 
                "monthly_rental_rate"=>"0.80000", 
                "number"=>"12109206500",
                "prefix"=>"210", 
                "rate_center"=>"SANANTONIO", 
                "region"=>"Texas, UNITED STATES", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/PhoneNumber/12109206500/", 
                "restriction"=>nil, 
                "restriction_text"=>nil, 
                "setup_rate"=>"0.00000", 
                "sms_enabled"=>true, 
                "sms_rate"=>"0.00000", 
                "type"=>"fixed", 
                "voice_enabled"=>true, 
                "voice_rate"=>"0.00850"
            }, {
                "country"=>"UNITED STATES", 
                "lata"=>566, 
                "monthly_rental_rate"=>"0.80000", 
                "number"=>"12109206501", 
                "prefix"=>"210", 
                "rate_center"=>"SANANTONIO", 
                "region"=>"Texas, UNITED STATES", 
                "resource_uri"=>"/v1/Account/XXXXXXXXXXXX/PhoneNumber/12109206501/", 
                "restriction"=>nil, 
                "restriction_text"=>nil, 
                "setup_rate"=>"0.00000", 
                "sms_enabled"=>true, 
                "sms_rate"=>"0.00000", 
                "type"=>"fixed", 
                "voice_enabled"=>true, 
                "voice_rate"=>"0.00850"
            }
        ]
    }
]
'''

# Buy a phone number
params = {
    'number' => '12109206499' # The phone number
}

response = p.buy_phone_number(params)
print response

'''
Sample Output
[201, {
        "api_id"=>"17d5d27a-b683-11e4-ac1f-22000ac51de6", 
        "message"=>"created", 
        "numbers"=>[
            {
                "number"=>"12109206499", 
                "status"=>"Success"
            }
        ], 
        "status"=>"fulfilled"
    }
]
'''

# Modify a number
params = {
    'number' => '12109206499', # Number that has to be modified
    'alias' => 'testing123' # The textual name given to the number
}

response = p.modify_number(params)
print response

'''
Sample Output
[202, {"api_id"=>"bb3a1c2a-9358-11e5-b5a0-22000aec8060", "message"=>"changed"}]
'''

# Unrent a number
params = {
        'number' => '12109206499' # Number that has to be unrented
}

response = p.unrent_number(params)
print response

'''
Sample Output
[204, ""]

'''
