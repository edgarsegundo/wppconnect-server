
upstream django_microservicesadm {
    server unix:///var/opt/python3.11.8.apps/microservicesadm/microservicesadm/microservicesadm.sock;
}

server {
        index index.html;
        charset UTF-8;
        server_name adm.p2digital.com.br;

        location /media {
                alias /var/www/microservicesadm/media;
        }

        location /static {
                alias /var/www/microservicesadm/static;
        }

        location /admin/ {
                uwsgi_pass django_microservicesadm;
                include /var/opt/python3.11.8.apps/microservicesadm/microservicesadm/uwsgi_params;
        }


        # Add the following location block to expose your service running on port 21465
        location /wpps/ {
            proxy_pass http://127.0.0.1:21465;  # Forward to your service running on port 21465
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }




	listen [::]:443 ssl; # managed by Certbot
	listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/adm.p2digital.com.br/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/adm.p2digital.com.br/privkey.pem; # managed by Certbot	
	include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
	ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    index index.html;
    charset UTF-8;
    server_name p2digital.com.br www.p2digital.com.br;

    location /media {
        alias /var/www/cliente_pag/media;
    }

    location /static {
        alias /var/www/cliente_pag/static;
    }

    location /admin/ {
        uwsgi_pass django;
        include /var/opt/python3.11.8.apps/cliente_pag/cliente_pag/uwsgi_params;
    }

    location / {
        if ($scheme != "https") {
             rewrite ^ https://$host$request_uri? permanent;
             break;
        }
	root /var/www/p2digital.com.br/public;
        break;
    }

    location ~* ^/casper/(.*) {
        proxy_pass http://aiservices.api:8888/casper/$1$is_args$args;
    }

    location /supervisor/ {
        proxy_pass http://aiservices.api:8888/supervisor/;
    }

    location ~* ^/mis/(.*) {
        proxy_pass http://127.0.0.1:8000/$1$is_args$args;
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range';
    }

    location ~* ^/binance/(.*) {
        proxy_pass http://127.0.0.1:8005/$1$is_args$args;
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range';
    }

    location /supervisor-vps/ {
       proxy_pass http://127.0.0.1:9001/;
    }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/adm.p2digital.com.br/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/adm.p2digital.com.br/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    index index.html;
    charset UTF-8;

    #server_name ~^(studio\.|preview\.)?p2digital\.com\.br$; # managed by Certbot
    server_name lms.p2digital.com.br; # managed by Certbot

    location / {
        if ($scheme != "https") {
             rewrite ^ https://$host$request_uri? permanent;
             #return 301 https://$server_name$request_uri;
             break;
        }
        proxy_pass http://aiservices.api:8888;
        break;
    }

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lms.p2digital.com.br/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lms.p2digital.com.br/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    #return 404; # managed by Certbot
}

server {
    if ($host = adm.p2digital.com.br) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    server_name adm.p2digital.com.br;
    listen 80 ;
    listen [::]:80 ;

    return 404; # managed by Certbot
}

server {
    if ($host = www.p2digital.com.br) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = p2digital.com.br) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    server_name p2digital.com.br www.p2digital.com.br;
    listen 80 ;
    listen [::]:80 ;
    return 404; # managed by Certbot
}
