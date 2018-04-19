.PHONY: clear test release execute
testopts = "--ExecutePreprocessor.timeout=120"
executeopts = --execute --to notebook --inplace $(testopts)

clear:
	for nb in lambda-notebook/*.ipynb; do jupyter nbconvert --clear-output "$$nb" || exit 1; done
	for nb in lambda-notebook/fragments/*.ipynb; do jupyter nbconvert --clear-output "$$nb" || exit 1; done
	for nb in lambda-notebook/misc/*.ipynb; do jupyter nbconvert --clear-output "$$nb" || exit 1; done
	for nb in lambda-notebook/tutorials/*.ipynb; do jupyter nbconvert --clear-output "$$nb" || exit 1; done

release: execute

execute:
	for nb in lambda-notebook/*.ipynb; do jupyter nbconvert $(executeopts) "$$nb" || exit 1; done
	for nb in lambda-notebook/fragments/*.ipynb; do jupyter nbconvert $(executeopts) "$$nb" || exit 1; done
	for nb in lambda-notebook/misc/*.ipynb; do jupyter nbconvert $(executeopts) "$$nb" || exit 1; done
	for nb in lambda-notebook/tutorials/*.ipynb; do jupyter nbconvert $(executeopts) "$$nb" || exit 1; done

test: execute

