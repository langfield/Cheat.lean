default:
	rm README.md
	cp Cheat.lean README.md
	sed -i 's/^\/--//g' README.md
	sed -i 's/^-\///g' README.md
