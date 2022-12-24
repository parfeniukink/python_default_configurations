RUN_UNIT_TESTS = pytest --cov-report=term-missing --cov --cov-fail-under=90
RUN_FORMATTERS = black . && isort ./
RUN_LINTER = flake8 ./

# alias cq = code-quality
.PHONY: cq
cq:
	${RUN_FORMATTERS} && ${RUN_LINTER}

.PHONY: test
test:
	${RUN_UNIT_TESTS}


