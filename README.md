
## 使用 Jekyll CMS 和 egg sass

- [jekyll](https://jekyllrb.com/) for cms
- [egg](https://wiredcraft.github.io/egg/) for scss
- [getform](https://getform.io/) for form service

## 下载 & 运行

1. 确保 Ruby 2.1.0+:

        ruby --version

2. 下载 `github-pages` gem;

        gem install github-pages

*如果无法运行，请查看 [GitHub help](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).*

3. 运行网站:

        make serve

    浏览器输入 http://localhost:4000. 这时会下载 Jekyll 配置文件 (`_config.yml`) 和开发版配置 (`_config-dev.yml`)，并确保配置选项 `--incremental`.

    *更多细节, 请查看 `Makefile`.*

## CI tool

- [Deploy Jekyll pages using Git and Travis CI](https://github.com/felixrieseberg/travis-jekyll-git)

Github 是一个很棒的方式来部署 Jekyll Pages, 但是在一些时候，你可能会想把 Jekyll page 部署在不同的服务器上就像（Azure Web Apps, AWS）。Jekyll 的优势在于创建静态网站，而我不想运行整个 Ruby 服务器。所以，我用 Travis CI 来创建 pipeline，提交新的 commits，测试页面，然后部署。下面是完整的流程：

- Create a new commit, triggering Travis CI
- Install Ruby, Jekyll, HTMLProofer, and all dependencies
- Compile the page
- Test that all images and links work (using HTMLProofer)
- If the test passed, enter the generated _site directory and create a new empty Git repository
- Add and commit all static files
- Force-push the result to a desired remote Git repo, suppressing any potentially compromising log messages

这里所需的文件包括 `.travis.yml`, `_config_ci.yml`, `scripts/build.sh` and `scripts/deploy.sh`. Travis 配置文件指导 Travis, 创建, 测试, 并部署， 用 `_config_ci.yml` 作为 Jekyll 配置文件， `scripts/deploy.sh` 作为定制的部署文件.

在你的项目中, 更新 `.travis.yml` 来配置你分支的黑白名单. 然后, 查看 `build.sh` 并确保 jekyll build 和 HTMLProofer 的配置使用你的网站 (大部分情况下是没问题的). 最后, 去你的 Travis Profile 页面去配置你的源仓库. 在那里, 需要增加三个环境变量 (environment variables):

- `git_user` Git username
- `git_password` Git password
- `git_target` Git target repository url (without `https://`)

把这四个文件(.travis.yml, _config_ci.yml, scripts/build.sh, scripts/deploy.sh)添加到你的源 `repo` - 大功告成!