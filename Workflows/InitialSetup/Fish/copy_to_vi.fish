function copy_to_vi --argument-names lang
	for i in compiler indent ftplugin syntax
		set nvim_origin "/home/$USER/.config/nvim/autoload/plugged/"
		set vi_destiny "/usr/share/vim/vim82"

		set file_name (find $nvim_origin -type f \
			| fzf -e -q "$i $lang.vim\$")
		echo (file "$file_name")
		if [ -r $file_name ]
			echo "There is no files :/"
		else
			echo $file_name $vi_destiny/$i
		end
	end
end
