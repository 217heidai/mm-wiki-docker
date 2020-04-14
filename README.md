# mm-wiki-docker
mm-wiki docker image. <https://github.com/phachon/mm-wiki>

# How to Setup
## 1. Setup mysql
```bash
docker container run -d \
    --restart=always \
    --name wiki_mysql \
    -v $HOME/mysql/etc/mysqld.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \ # mysql config file
    -v $HOME/mysql/data:/var/lib/mysql \ # mysql data
    -e MYSQL_ROOT_PASSWORD=mm_wiki \ # mysql root password
    -e MYSQL_USER=mm_wiki \ # mm-wiki user name
    -e MYSQL_PASSWORD=mm_wiki \ # mm-wiki user password
    -e MYSQL_DATABASE=mm_wiki \ # mm-wiki database name
    -d mysql:5.7 \
    --character-set-server=utf8mb4 \
    --collation-server=utf8mb4_unicode_ci
```

## 2. Setup mm-wiki
```bash
docker container run -d \
    --restart=always \
    --name wiki \
    -p 8080:8080 \
    -v $HOME/wiki/bin:/mm-wiki \ # mm-wiki
    -v $HOME/wiki/data:/data \ # mm-wiki data
    --link wiki_mysql:db \ # link mysql
    217heidai/mm-wiki
```

## 3. How to Configure
1. <http://127.0.0.1:8080>, configure it.
2. Restart your mm-wiki container.
3. <http://127.0.0.1:8080>, login. Default user is 'root', and pwssword is what you set in mysql container.

# How to Upgrade
1. stop and remove your existing mm-wiki container.
2. setup new mm-wiki container.
3. reboot the new mm-wiki container.

## ChangeLog
| Date      | Content                                                              |
|-----------|----------------------------------------------------------------------|
| 2020.04.14 | mm-wiki v0.1.8 |
| 2020.02.20 | mm-wiki v0.1.7 |
| 2020.02.19 | mm-wiki v0.1.6 |
| 2019.12.30 | mm-wiki v0.1.5 |
| 2019.12.13 | mm-wiki v0.1.4 |
| 2019.08.31 | mm-wiki v0.1.3 |
