# Behanc.io

Aplicación web que busca replicar el sitio web [Behance](https://www.behance.net) de Adobe.

Su funcionalidad es similar a una red social, su objetivo es la exposición de proyectos siendo un portafolio digital para artistas, diseñadores gráficos, fotografos, etc.

* Este fue mi primer acercamiento con Rails, además de ser mi proyecto final del programa `Padawans 2021` de [michelada.io](https://www.michelada.io) .

## Features
1. Autenticación
2. Usuario puede editar su perfil
3. Usuario puede ver su perfil
4. Usuario puede ver el perfil público de otro usuario
5. Usuario puede crear un proyecto
6. Usuario puede ver detalle de un proyecto
7. Usuario puede ver los proyectos de otro usuario
8. Usuario puede seguir a otro usuario
9. Usuario puede ver proyectos desde home
10. Usuario puede dar like a un proyecto
11. Usuario puede comentar un proyecto

* Feature especial: Notificar seguidores en tiempo real.

## Recursos utilizados

* `ActionText` para el contenido de los projectos con rich text.

* `ActionCable` para implementar notificaciones en tiempo real a los followers cuando un usuario al que sigues publica un proyecto nuevo. (también utiliza `redis`)

* `ActiveStorage` y `AWS` para almacenamiento de imagenes en la nube.

* `Devise` es utilizado para la autenticación de usuarios.

## Especificaciones

* La base de datos utilizada es `PostgreSQL`.

* Se utiliza `rubocop` para tener mantener la consistencia en el código.

* Tiene deploy automático a staging y producción en `HEROKU`, desde la rama `development` y la rama `master` respectivamente. Cuenta con verificación de test y de `rubocop` previos a publicarse en gitlab y previo al deployment a `HEROKU`.

* Los test utilizan `minitest`, hay test para controladores y modelos.

* Para la UI se utilizó CSS puro con SASS implementando `7-1`, se encuentra dentro de la carpeta javascript.

## Uso
Para utilizar la app es necesario correr el servidor de `Rails` y `Redis`.

```bash
$ rails s
```

En una pestaña distinta de la terminal corre el comando:
```bash
$ redis-server
```
