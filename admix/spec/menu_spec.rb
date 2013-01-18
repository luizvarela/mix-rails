require 'spec_helper'

describe 'Admix::Menu' do

	before :all do
		@menu = Admix::Menu.new
	end

	describe '#submenu' do
		it 'should add a children to menu instance' do
			@menu.submenu do |submenu|
				submenu.title = 'Submenu title'
				submenu.url 	= 'submenu_path'
			end
			@menu.children.size.should be_eql 1

			@menu.submenu do |submenu|
				submenu.title = 'Submenu title'
				submenu.url 	= 'submenu_path'
			end
			@menu.children.size.should be_eql 2
		end
	end

end
