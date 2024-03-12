.PHONY:
build-macos:
	@echo Hello macOS

.PHONY:
build-ios:
	@echo Hello ios

.PHONY:
build-windows:
	@echo Hello Windows

.PHONY:
genconf:
#	@pkl eval -f yaml ./Config/swiftlint.pkl > .swiftlint.yml
	@pkl eval -f yaml ./Config/project_macos.pkl > ./App/macOS/project.yml

.PHONY:
clean:
	python ./Tools/clean_proj.py

.PHONY:
hard-clean:
	python ./Tools/clean_proj.py --hard
