require_relative '../models/address_book'
 
 RSpec.describe AddressBook do  

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end


   describe "attributes" do
     it "should respond to entries" do
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
     	expect(book.entries).to be_a(Array)
     end

     it "should initialize entries as empty" do
     	expect(book.entries.size).to eq(0)
     end
   end

   describe "#add_entry" do
   	it "adds only one entry to the address book" do
   		book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
   		expect(book.entries.size).to eq(1)
   	end

   	it "adds the correct information to entries" do
   		book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
   		new_entry = book.entries[0]
   		expect(new_entry.name).to eq('Ada Lovelace')
   		expect(new_entry.phone_number).to eq('010.012.1815')
   		expect(new_entry.email).to eq('augusta.king@lovelace.com')
   		end
   		end

   describe "#import_from_csv" do
     it "tests the csv import process" do
       book.import_from_csv("entries_2.csv")
       book_size = book.entries.size

       # Check the size of the AddressBook.entries
       expect(book_size).to eql 3
     end

     it "imports the 1st entry" do
       book.import_from_csv("entries_2.csv")
       # Check the first entry
       entry_one = book.entries[0]
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")

     end

     it "imports the 2nd entry" do
       book.import_from_csv("entries_2.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")

     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries_2.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")

     end

   end
 
 end	