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
    --character-set-server=utf8 \
    --collation-server=utf8_bin
```

## 2. Setup mm-wiki
```bash
docker container run -d \
    --restart=always \
    --name wiki \
    -p 8080:8080 \
    -v $HOME/wiki/bin:/mm-wiki \ # mm-wiki
    -v $HOME/wiki/wiki/data:/data \ # mm-wiki data
    --link wiki_mysql:db \ # link mysql
    heidai/mm-wiki
```

## How to Configure
1. <http://127.0.0.1:8080>, configure it.
2. Restart your mm-wiki container.
3. <http://127.0.0.1:8080>, login. Default user is 'root', and pwssword is what you set in mysql container.