## usage

1. `vars/main.yml.tmpl` に必要パラメータを記入して `vars/main.yml` に配置
2. 以下のコマンドを実行

> ansible-playbook -K [path/to/playbook]

ex)
> ansible-playbook -K mint.yml
