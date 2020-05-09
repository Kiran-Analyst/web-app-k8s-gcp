### Encrpt service sccount file using travis-ci-cli docker image
```
web-app-k8s-gcp  $ docker run -it -v ~/keys:/app ruby sh

# gem install travis

# travis login
Shell completion not installed. Would you like to install it now? |y| y
We need your GitHub login to identify you.
This information will not be sent to Travis CI, only to api.github.com.
The password will not be displayed.

Try running with --github-token or --auto if you don't want to enter your password anyway.

Username: kiran.dataworld@gmail.com
Password for kiran.dataworld@gmail.com: *********
Successfully logged in as Kiran-Analyst!


# travis encrypt-file personal-account.json -r Kiran-Analyst/web-app-k8s-gcp
encrypting personal-account.json for Kiran-Analyst/web-app-k8s-gcp
storing result as personal-account.json.enc
storing secure env variables for decryption

Please add the following to your build script (before_install stage in your .travis.yml, for instance):

    openssl aes-256-cbc -K $encrypted_9b3d2cfde564_key -iv $encrypted_9b3d2cfde564_iv -in personal-account.json.enc -out personal-account.json -d

Pro Tip: You can add it automatically by running with --add.

Make sure to add personal-account.json.enc to the git repository.
Make sure not to add personal-account.json to the git repository.
Commit all changes to your .travis.yml.

$ cp ~/keys/personal-account.json.enc .
$ ls
Read Me.md			client				gcloud-setup.md			personal-account.json.enc	server				worker

```