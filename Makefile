init:
	pre-commit install

check:
	pre-commit run --all-files
