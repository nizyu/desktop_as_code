## usage

1. `vars/main.yml.tmpl` に必要パラメータを記入して `vars/main.yml` に配置
2. 以下のコマンドを実行

> ansible-playbook --extra-vars "repo_root=[path/to/repo_root]" -K [path/to/playbook]

ex)
> ansible-playbook --extra-vars "repo_root=$(pwd)" -K mint.yml
