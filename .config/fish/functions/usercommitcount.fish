function usercommitcount
	git shortlog | grep -E '^[^ ]'
end
