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
  
end
