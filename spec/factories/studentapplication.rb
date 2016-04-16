FactoryGirl.define do
    factory :studentapplication do
        major 'EECS'
        graduation '2016'
        info 'cs169'
        essay 'essay'
        # id '1'
        status 'Pending'
        # user {User.new(name: "Rowan", email: "rowan@funbun.com", password "password123")}
    end
end