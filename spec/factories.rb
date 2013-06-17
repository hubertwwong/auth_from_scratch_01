FactoryGirl.define do
  
  # create users of foo1@awesome.com, foo2@awesome.com, etc...
  factory :user do
    email { |n| "foo#{n}@awesome.com"}
    password 'password'
        
    # Child of :user factory, since it's in the `factory :user` block
    #factory :admin do
    #  admin true
    #end
  end
  
  factory :post do
    association :user, factory: :user
    title { |n| "post #{n}"}
    description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vulputate, ante eget gravida bibendum, erat elit eleifend urna, in consequat nisi eros vel dui. Aenean tempus molestie elit, eget mattis dolor mattis sit amet. Maecenas pretium sit amet erat nec molestie. Maecenas malesuada mi massa, non gravida nisi convallis sit amet. Etiam risus metus, tincidunt at arcu et, fermentum tristique libero. Suspendisse at luctus sem. Etiam risus velit, consectetur at pharetra non, pellentesque quis nibh. Aliquam at ante dapibus, pharetra ipsum non, pretium ipsum. Nam rhoncus accumsan diam et mollis. Pellentesque ut mauris dictum, imperdiet turpis eget, tempus odio. Nunc dignissim volutpat interdum. Curabitur rhoncus lorem eget purus pretium, vitae placerat arcu laoreet. Aliquam sed nunc sit amet turpis tempus tempus. Etiam leo tellus, aliquet ac feugiat ac, feugiat a nunc. In a erat elit.'
  end
  
end
