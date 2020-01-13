require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid  
  end
    describe '#user table column' do
      it {is_expected.to have_db_column :id}
      it {is_expected.to have_db_column :first_name}
      it {is_expected.to have_db_column :last_name}
      it {is_expected.to have_db_column :phone_number}
      it {is_expected.to have_db_column :pin}
      it {is_expected.to have_db_column :id_number}
      it {is_expected.to have_db_column :balance}
    end

    context 'creating user at db level' do
      it {is_expected.to validate_presence_of :phone_number}
      it {is_expected.to validate_presence_of :id_number}
    end
  
    describe '#validation of user attributes' do
    
      it {is_expected.to validate_presence_of(:first_name)}
      it {is_expected.to validate_presence_of(:last_name)}
      it {is_expected.to validate_presence_of(:phone_number)}
      it {is_expected.to validate_presence_of(:password_digest)}
      it {is_expected.to validate_presence_of(:id_number)}
    
      it {is_expected.to validate_numericality_of (:pin) } 
      it {is_expected.to validate_numericality_of (:id_number) }
      it {is_expected.to validate_numericality_of(:phone_number)}
      
      it {is_expected.to validate_length_of(:pin).is_equal_to (4)}     
      it {is_expected.to validate_length_of(:first_name).is_at_most(30)}
      it {is_expected.to validate_length_of(:last_name).is_at_most(30)}
      it {is_expected.to validate_length_of(:id_number).is_at_least(7).is_at_most(9)}
      it {is_expected.to validate_length_of(:phone_number).is_at_least(10).is_at_most(13)}

      it {is_expected.to validate_confirmation_of(:password) }      
      
      subject { User.create(:first_name=> "John", :last_name=> "Doe", :id_number=> "98008909", :phone_number=>"0722797082", :password=>"password56)(") }
      it {is_expected.to validate_uniqueness_of(:phone_number).case_insensitive}
      it {is_expected.to validate_uniqueness_of(:id_number).case_insensitive}

      context 'allows valid first names' do
        valid_first_names = ["Chantelle", "EVans", "PoPS", "frank", "OBADO", "ruTh", "Sigu", "calvin"]
        valid_first_names.each do |name|
          it {is_expected.to allow_value(name).for(:first_name)}
        end
      end

      context 'does not allow invalid first names' do
        invalid_first_names = ["Ch56ntelle", "E6s", "5648", "frank670", "0BAD0", "@#%$", "S!gu", "c@lvin"]
        invalid_first_names.each do |no_name|
          it {is_expected.to_not allow_value(no_name).for(:first_name)}
         end
        end

        context 'allows valid last names' do
          valid_last_names = ["Kyendereta", "oKOth", "obuya", "MIDIGO"]
          valid_last_names.each do |name|
            it {is_expected.to allow_value(name).for(:last_name)}
        end
      end

      context 'does not allow invalid last names' do
        invalid_last_names = ["ky3nd3r3ta", "0k0th", "5648", "m1d1g0", "0BAD0", "@#%$", "m@gw@", "m0ku@"]
        invalid_last_names.each do |no_name|
          it {is_expected.to_not allow_value(no_name).for(:last_name)}
         end
      end

      context 'allows valid password' do
        valid_password=["passWORD34.", "seCret65?mb", "12345678iK-", "uhjASWE3424!@#~", "BestLeadDes!gN1"]
        valid_password.each do |password|
          it {is_expected.to allow_value(password).for(:password)}
          end
      end

      context 'does not allow invalid password' do 
        invalid_password=["CAPITALLETTERS", "smallletters", "sC67@!", "!@#$%^&*()_*~", "0707065562", "kyeND"]
        invalid_password.each do |no_password|
          it {is_expected.to_not allow_value(no_password).for(:password)}
        end
     end

     context 'password should at least contain a digit' do
      pass = ["pass@WORD34", 'passworD%56']
      pass.each do |p|
        it {is_expected.to allow_value(p).for (:password)}
     end

     context 'password should be secure' do
      it {is_expected.to have_secure_password }
     end
    end

     describe '#creating user' do
      it 'creates user with valid attributes' do
        user = FactoryBot.create(:user)
        expect(user.first_name).to eq 'John'
        expect(user.balance).to eq 0.0
        expect(user.pin).to eq "1234"
      end

       it 'does not allow existing phone number' do
        FactoryBot.create(:user)
        user = FactoryBot.build(:user, phone_number: "0707065562", id_number: "0000000")
        user.save
        expect(user).not_to be_valid
        expect(user.errors.messages[:phone_number]).to eq ["has already been taken"]
      end

      it "does not allow phone number that is not a digit" do
        user = FactoryBot.build(:user, phone_number: "abcd1234567")
        user.save
        expect(user).not_to be_valid
        expect(user.errors.messages[:phone_number]).to eq ["is not a number"]
      end

      it 'does not allow phone number that has digits less than 10' do
        user = FactoryBot.build(:user, phone_number: "12345678")
        user.save
        expect(user.errors.messages[:phone_number]).to eq ["is too short (minimum is 10 characters)"]
      end

      it 'does not allow phone number with digits more than 13' do
        user = FactoryBot.build(:user, phone_number: "123456789101213")
        user.save
        expect(user.errors.messages[:phone_number]).to eq ["is too long (maximum is 13 characters)"]
      end

      it 'does not allow id number less than 7 digits' do
        user = FactoryBot.build(:user, id_number: "12345")
        user.save
        expect(user.errors.messages[:id_number]).to eq ["is too short (minimum is 7 characters)"]
      end

      it 'does not allow digits more than 9 characters' do
        user = FactoryBot.build(:user, id_number: "1234567890123")
        user.save
        expect(user.errors.messages[:id_number]).to eq ["is too long (maximum is 9 characters)"]
      end

      it 'only accepts an id_number which are digits' do
        user = FactoryBot.build(:user, id_number: "58657fre6")
        user.save
        expect(user.errors.messages[:id_number]).to eq ["is not a number"]
      end

      it 'does not allow existing id_number' do
        FactoryBot.create(:user)
        user = FactoryBot.build(:user, id_number: "12345678", phone_number: "0700000000")
        user.save
        expect(user.errors.messages[:id_number]).to eq ["has already been taken"]
      end

      it 'password should be at least 8 characters' do
        user = FactoryBot.build(:user, password:"mimi", password_confirmation: "mimi")
        user.save
        expect(user.errors.messages[:password]).to eq ["please input a stronger password"]
      end

      it 'password should contain at least a digit' do
        user = FactoryBot.build(:user, password: "charachters", password_confirmation:"charachters")
        user.save
        expect(user.errors.messages[:password]).to eq ["please input a stronger password"]
      end

      it 'password should contain uppercase' do
        user = FactoryBot.build(:user, password: "tumbleweed3", password_confirmation:"tumbleweed3")
        user.save
        expect(user.errors.messages[:password]).to eq ["please input a stronger password"]
      end

      it 'password should contain special character' do
        user = FactoryBot.build(:user, password: "tumbleweed3", password_confirmation:"tumbleweed3")
        user.save
        expect(user.errors.messages[:password]).to eq ["please input a stronger password"]
      end

      it 'password should contain lowercase' do
        user = FactoryBot.build(:user, password: "TUMBLEWEED3", password_confirmation:"TUMBLEWEED3")
        user.save
        expect(user.errors.messages[:password]).to eq ["please input a stronger password"]
      end

      it 'passwords should match' do
        user = FactoryBot.build(:user, password: "passwoRD54#", password_confirmation:"passwoRD54@")
        user.save
        expect(user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
        end
  
    end

     it "raise database error when user attributes are null" do
      valid_user_attrs = { first_name: "Jane", last_name: "Doe", id_number: "1234567", phone_number: "0700000000", pin: "1234", password: "PassWord@123."}
      user_without_first_name_attr =   valid_user_attrs.slice(:last_name,:id_number,:phone_number, :pin, :password)
      user_without_first_name = User.new(user_without_first_name_attr)
      expect { user_without_first_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
      user_without_last_name_attr =   valid_user_attrs.slice(:first_name,:id_number,:phone_number, :pin, :password)
      user_without_last_name = User.new(user_without_last_name_attr)
      expect { user_without_last_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
     end
  end
end