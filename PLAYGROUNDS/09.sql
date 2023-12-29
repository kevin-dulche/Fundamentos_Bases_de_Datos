-- Para resolver este desafio debes crear una tabla comentarios, agregar al menos 3 comentarios, imprimir todos los comentarios de la tabla y finalmente imprimir los comentarios de un usuario especial con un formato en específico.

-- Reto 1: crear la tabla
-- Crea una tabla comentarios con las columnas id, cuerpo_comentario, usuario_id y post_id.

-- id	cuerpo_comentario	usuario_id	post_id
-- ...	...	...	...
-- Reto 2: agrega registros
-- Inserta al menos 3 comentarios en la tabla. Puedes escribir tantos comentarios como quieras. Asegúrate de que solo en 2 el usuario_id sea 1.

-- Reto 3: imprime registros
-- Imprime todas las columnas de todos los registros de la tabla comentarios.

-- Reto 4: imprime registros del usuario 1
-- Selecciona los 2 comentarios del usuario 1. Haz un JOIN para conseguir la información del post relacionado con la propiedad post_id y el usuario rerlacionado con la propiedad usuario_id. Imprime la propiedad comentarios.cuerpo_comentario como comentario, usuarios.login como usuario y posts.titulo como post.

-- comentario	usuario	post
-- ...	israel	...
-- ...	israel	...

-- Tu código aquí 👇
CREATE TABLE IF NOT EXISTS comentarios (
  id INTEGER PRIMARY KEY NOT NULL,
  cuerpo_comentario TEXT NOT NULL,
  usuario_id INTEGER NOT NULL,
  post_id INTEGER NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO comentarios(id, cuerpo_comentario,usuario_id,post_id)
VALUES
(1,"Comentario 1",1,123),
(2,"Comentario 2",1,234),
(3,"Comentario 3",2,345);

SELECT *
FROM comentarios;

SELECT comentarios.cuerpo_comentario AS comentario, usuarios.login AS usuario, posts.titulo AS post
FROM comentarios
LEFT JOIN posts ON posts.id = comentarios.post_id
LEFT JOIN usuarios ON usuarios.id = comentarios.usuario_id
WHERE comentarios.usuario_id = 1;