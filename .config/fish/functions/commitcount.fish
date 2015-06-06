function commitcount -h "View the repo's total commit count"
	git rev-list HEAD --count
end
