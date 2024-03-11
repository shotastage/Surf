.PHONY:
genconf:
#	@pkl eval -f yaml ./Config/swiftlint.pkl > .swiftlint.yml
	@pkl eval -f yaml ./Config/project_macos.pkl > ./App/macOS/project.yml

.PHONY:
clean:
	python ./Tools/clean_proj.py

