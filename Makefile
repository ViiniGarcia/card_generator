# Makefile for deploying Flutter web app to GitHub Pages

# Update These Variables
BASE_HREF = '/badge-gen-website/'
GITHUB_REPO = https://${{secrets.DEPLOY}}@github.com/ViiniGarcia/badge-gen-website.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	
	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git config --global user.email viniciusgrlopes@hotmail.com && \
    git config --global user.name ViiniGarcia && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git checkout -b main && \
    git add --all && \
    git commit -m "update" && \
    git push origin main -f

	cd ../..
	@echo "🟢 Finished Deploy"

.PHONY: deploy-web