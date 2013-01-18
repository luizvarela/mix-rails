require 'spec_helper'

describe 'Admix::MenusContainer' do

	before :all do
		# removes all Menus
		@menu = Admix::Menu.new
		@menu.key = :menu

		@menu2 = Admix::Menu.new
		@menu2.key = :menu2

		@menu2.submenu do |submenu|
			submenu.title = 'Submenu'
			submenu.url   = 'submenu_path'
			submenu.key   = :submenu
		end

	end

	before :each do
		Admix::MenusContainer.clear!
	end

	describe '#add' do
		it 'should add menu' do
			Admix::MenusContainer.add @menu
			Admix::MenusContainer.all.length.should be_eql 1

			Admix::MenusContainer.add @menu2
			Admix::MenusContainer.all.length.should be_eql 2
		end

		it 'should raise an error if no instance of Menu is given' do
			expect {Admix::MenusContainer.add 'not a menu'}.to raise_error
		end

		it 'should not add duplicated menus' do
			Admix::MenusContainer.add @menu
			Admix::MenusContainer.add @menu2
			Admix::MenusContainer.add @menu
			Admix::MenusContainer.add @menu2
			Admix::MenusContainer.all.length.should be_eql 2
		end
	end

	describe '#find' do
		it 'should raise an error if no key is given' do
			expect {Admix::MenusContainer.find('')}.to raise_error
		end

		it 'should return the Menu for the given key or false if key does not exists' do
			Admix::MenusContainer.add @menu
			Admix::MenusContainer.add @menu2

			Admix::MenusContainer.find(:menu).should be_instance_of Admix::Menu
			Admix::MenusContainer.find(:submenu).should be_instance_of Admix::Menu
			Admix::MenusContainer.find(:nonexistent).should be_false
		end
	end

end
