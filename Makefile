# ************************************************
# ********** pip-tools **********
# ************************************************

.PHONY: lock  # pin prod dependencies
lock:
	pip-compile requirements.in -o requirements.txt


.PHONY: lock.dev  # pin dev dependencies
lock.dev:
	pip-compile requirements.dev.in -o requirements.dev.txt


.PHONY: lock.all  # pin all dependencies
lock.all:
	pip-compile requirements.in -o requirements.txt
	pip-compile requirements.dev.in -o requirements.dev.txt


.PHONY: sync  # sync for prod dependencies
sync:
	pip-sync requirements.txt


.PHONY: sync.dev  # sync for dev dependencies
sync.dev:
	pip-sync requirements.dev.txt


.PHONY: update  # lock & sync for prod dependencies
update:
	pip-compile requirements.in -o requirements.txt
	pip-sync requirements.txt


.PHONY: update.dev  # lock & sync for prod dependencies
update.dev:
	pip-compile requirements.dev.in -o requirements.dev.txt
	pip-sync requirements.dev.txt


.PHONY: update.all  # lock & sync for all dependencies
update.all:
	pip-compile requirements.in -o requirements.txt
	pip-compile requirements.dev.in -o requirements.dev.txt
	pip-sync requirements.dev.txt


.PHONY: upgrade  # upgrade prod dependencies. Generate new .txt file
upgrade:
	pip-compile --upgrade requirements.in -o requirements.txt


.PHONY: upgrade.dev  # upgrade dev dependencies. Generate new .dev.txt file
upgrade.dev:
	pip-compile --upgrade requirements.dev.in -o requirements.dev.txt


.PHONY: upgrade.all  # upgrade all dependencies. Generate new .txt files
upgrade.all:
	pip-compile --upgrade requirements.in -o requirements.txt
	pip-compile --upgrade requirements.dev.in -o requirements.dev.txt


# ************************************************
# ********** application **********
# ************************************************
.PHONY: run  # run the application in a prod mode
run:
	# NOTE:configurable via environment variables
	gunicorn src.main:app --worker-class uvicorn.workers.UvicornWorker


.PHONY: run.dev  # run the application in a dev mode
run.dev:
	# NOTE:configurable via environment variables
	uvicorn src.main



# ************************************************
# ********** code quality **********
# ************************************************

# fix formatting / and order imports
.PHONY: format
format:
	python -m black ./
	python -m isort ./


# check type annotations
.PHONY: types
types:
	python -m mypy --check-untyped-defs ./src


# run tests
.PHONY: tests
tests:
	python -m pytest --cov-report=term-missing -vvv -x .


# check everything
.PHONY: check
check:
	python -m ruff .
	python -m black --check .
	python -m isort --check .
	python -m mypy --check-untyped-defs .
	python -m pytest --cov-report=term-missing --cov --cov-fail-under=90 .
