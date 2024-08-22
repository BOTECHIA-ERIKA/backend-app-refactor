


CREATE TABLE usuarios (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    primeiro_nome TEXT NOT NULL,
    ultimo_sobrenome TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE, 
    password_hash TEXT NOT NULL, 
    path_profile TEXT NOT NULL UNIQUE,
    data_nacimento TEXT NOT NULL,
    avatar_url TEXT NOT NULL DEFAULT "https://i.postimg.cc/QNYfTjwh/Sed-01-1024.png",
    is_user_ativo BLOB NOT NULL DEFAULT 1,
    is_premium BLOB NOT NULL DEFAULT 0,
    is_colab_dev BLOB NOT NULL DEFAULT 0,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW'))
);



INSERT INTO usuarios(
    id, primeiro_nome, ultimo_sobrenome, username, email, password_hash, path_profile, data_nacimento, avatar_url, is_user_ativo, is_premium, is_colab_dev
) VALUES (
    "aa9a1ef6-373f-4bd5-8f4f-ef0f519e0606",
    "JOSE",
    "SILVA",
    "JOSE-SILVA",
    "JOSE.SILVA@GMAIL.COM",
    "$2a$12$KE.K.lHqH0sBtCuZDfQ9m.d2.abn5KXF.Cbv1t.hlUo29DwoyT9ry" /*"JSilva89!*"*/,
    "JOS-AA9-LVA-989",
    "21-03-1989",
    "https://i.postimg.cc/QNYfTjwh/Sed-01-1024.png",
    1,
    0,
    1
),
    (
    "2d2bb032-4a02-4ede-8925-49e9ae7ef71d",
    "MARIA",
    "FERNANDEZ",
    "MARIAZINHA-FERNANDEZ",
    "MAHFERNANDEZ@GMAIL.COM",
    "$2a$12$IKCYRVdNrK.BPwEYfRti5Opev5nrp8zhMO4p41PCcKpprb/j8JsRi" /*"MF93!*Z"*/,
    "MAH-2D2-DEZ-993",
    "21-03-1993",
    "https://i.postimg.cc/QNYfTjwh/Sed-01-1024.png",
     1,
     0,
     1
);

SELECT * FROM usuarios;


CREATE TABLE memorias (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    titulo TEXT NOT NULL ,
    descricao TEXT NOT NULL,
    usuario_id TEXT NOT NULL,
    img_url TEXT,
    video_url TEXT,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE memorias;
DROP TABLE tarefas;

INSERT INTO memorias (
    id,
    titulo,
    descricao,
    usuario_id,
    img_url
) VALUES (
    "67e5ebe9-a9b4-4db5-914f-70f14ab47c6a",
    "SAO PAULO MASP",
    "VISITA AO MUSEU EM SP CHAMADO MASP, OTIMO DOMINGO COM A FAMILIA, QUERO SEMPRE LEMBRAR EM MINHAS MEMORIAS",
    "aa9a1ef6-373f-4bd5-8f4f-ef0f519e0606",
    "https://i.postimg.cc/G2TPYjK5/masp.png"
)


SELECT * FROM memorias;

CREATE TABLE tarefas (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    titulo TEXT NOT NULL ,
    conteudo TEXT NOT NULL,
    status INTEGER NOT NULL DEFAULT 0,
    usuario_id TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    end_date TEXT, 
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO tarefas (
    id,
    titulo,
    conteudo,
    status,
    usuario_id
) VALUES (
    "3cb85d19-fb28-4dc5-9df1-233e310d0483",
    "COMPRAR MORTADELA",
    "300g MARBA",
    0,
    "aa9a1ef6-373f-4bd5-8f4f-ef0f519e0606"
);


CREATE TABLE agenda(
    id TEXT NOT NULL PRIMARY KEY,
    img_url TEXT NOT NULL DEFAULT "https://i.postimg.cc/cH3yxmXc/OIP-f5gfghce0-T5nz76-W5r-YCl-QHa-Ha-w-213-h-213-c-7-r-0-o-5-dpr-1-3-pid-1.jpg",
    usuario_id TEXT NOT NULL ,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO agenda(
    id,
    usuario_id
)
VALUES(
    '6735d7d2-2a3e-4ca1-9b28-7fe591f152e6',
    'aa9a1ef6-373f-4bd5-8f4f-ef0f519e0606'
),(
    'd10d087a-10b4-4185-be94-561d2b081df1',
    '2d2bb032-4a02-4ede-8925-49e9ae7ef71d'
);

SELECT * FROM agenda;
DROP TABLE agenda;
DROP TABLE item_agenda;
DROP TABLE item_agenda;
CREATE TABLE item_agenda(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    nome_contato TEXT NOT NULL,
    img_contato TEXT  DEFAULT "https://i.postimg.cc/cH3yxmXc/OIP-f5gfghce0-T5nz76-W5r-YCl-QHa-Ha-w-213-h-213-c-7-r-0-o-5-dpr-1-3-pid-1.jpg",
    id_agenda TEXT NOT NULL, 
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    updated_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (id_agenda) REFERENCES agenda(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE telefones_agenda(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    telefone_principal TEXT NOT NULL,
    nome_responsavel TEXT,
    telefone_1 TEXT,
    telefone_2 TEXT,
    whatsapp TEXT,
    email TEXT,
    id_agenda TEXT NOT NULL,
    id_item_agenda TEXT
)

CREATE TABLE endereco_agenda(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    nome_do_endereco TEXT NOT NULL,
    tipo_logradouro TEXT NOT NULL,
    logradouro TEXT NOT NULL,
    numero_logradouro TEXT ,
    tipo_complemento TEXT,
    numero_complemento TEXT,
    bairro TEXT NOT NULL,
    id_cidade TEXT NOT NULL,
    id_estado TEXT NOT NULL,
    id_pais TEXT NOT NULL,
    id_codigo_postal TEXT NOT NULL,
    id_agenda TEXT NOT NULL,
    id_contato TEXT NOT NULL,
    coordenada1 TEXT ,
    coordenada2 TEXT ,
    coordenada3 TEXT,
)

CREATE TABLE paises(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    pais TEXT NOT NULL UNIQUE   
)


CREATE TABLE estados (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    estado TEXT NOT NULL UNIQUE ,
    id_pais TEXT NOT NULL
)


CREATE TABLE cidades (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    cidade TEXT NOT NULL UNIQUE ,
    id_estado TEXT NOT NULL
)



CREATE TABLE codigo_postal (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    cep TEXT NOT NULL UNIQUE 
)





CREATE TABLE categoria_item_agenda(
    id TEXT NOT NULL PRIMARY KEY UNIQUE,
    is_contato_pessoal BLOB DEFAULT 0,
    is_contato_comercial BLOB DEFAULT 0,
    is_contato_familiar BLOB DEFAULT 0,
    is_contato_emergencia BLOB DEFAULT 0,
    item_agenda_id TEXT,
    endereco_agenda_id TEXT, 
)

INSERT INTO item_agenda(
    id,
    nome_contato,
    telefone,
    is_contato_familiar,
    id_agenda
)VALUES(
'41d9eadd-cb9e-431c-bfcc-c2bf419908c8',
'PRIMO',
'55-11-4473-0988',
1,
'd10d087a-10b4-4185-be94-561d2b081df1'
);

SELECT * FROM agenda INNER JOIN item_agenda ON item_agenda.id_agenda = agenda.id;

CREATE TABLE dias_da_semana(
    id TEXT not null unique,
    dia TEXT not null unique
 )


CREATE TABLE enderecos (

)

CREATE TABLE profile(
    id TEXT NOT NULL UNIQUE,
    usuario_id TEXT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO profile(
    id,
    usuario_id)
VALUES(
    '431b47f4-0aec-49ed-91a9-f516efba0ca1',
    'aa9a1ef6-373f-4bd5-8f4f-ef0f519e0606'
),(
    '4dfb9bb0-8642-4c7a-bcb7-29a8e1a77d4d',
    '2d2bb032-4a02-4ede-8925-49e9ae7ef71d'
);





CREATE TABLE seguido_e_seguidor(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    profile_id TEXT NOT NULL,
    profile_seguidor_id TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (profile_seguidor_id) REFERENCES profile(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);



INSERT INTO seguido_e_seguidor(
    id,
    profile_id,
    profile_seguidor_id
    )VALUES(
    '0a1519e7-2aca-4ba2-9c37-affcbc12d72f',
    '431b47f4-0aec-49ed-91a9-f516efba0ca1',
     '4dfb9bb0-8642-4c7a-bcb7-29a8e1a77d4d'
),(
    '1c3d705e-508c-4c53-a2e2-3eb7a045125c',
    '4dfb9bb0-8642-4c7a-bcb7-29a8e1a77d4d',
    '431b47f4-0aec-49ed-91a9-f516efba0ca1'
);





CREATE TABLE posts(
    id TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    img_url TEXT, 
    description TEXT,
    profile_id TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (profile_id) references profile(id)
    ON UPDATE CASCADE ON DELETE CASCADE 
);
DROP TABLE posts;
INSERT INTO posts (
    id,
    title,
    img_url,
    description,
    profile_id
) VALUES (
    '295bb282-41e3-4730-98a2-432e27a3a757',
    'Funcionalidade Agenda',
    'https://i.postimg.cc/6pGGSbs6/png-transparent-computer-icons-agenda-diary-agenda-miscellaneous-blue-photography-thumbnail.png',
    'A FUNCIONALIDADE AGENDA E DEMAIS SUPER COMPLETA',
    '431b47f4-0aec-49ed-91a9-f516efba0ca1'
),
(
'bf7db944-0489-4368-93cc-8e81887fb338',
    'ASSINEI O PREMIUM',
    'https://i.postimg.cc/1zdw48kB/1.jpg',
    'ME SURPREENDI COM AS FUNCIONALIDADES DO PREMIUM RECOMENDO!',
    '431b47f4-0aec-49ed-91a9-f516efba0ca1'
),
(
'f5b25e8f-604c-420e-9a42-52548c61a41c',
    'STATUS 👾🤖',
    'https://i.postimg.cc/yNq4XjCS/OIP-rfr-9-L-5-YH4ld9-PAFTqt-FAHa-Et-w-274-h-180-c-7-r-0-o-5-dpr-1-3-pid-1.jpg',
    'JOGANDO VALORANT',
    '431b47f4-0aec-49ed-91a9-f516efba0ca1'
);


CREATE TABLE comentarios(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    post_id TEXT NOT NULL,
    profile_id TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (post_id) REFERENCES post(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (profile_id) REFERENCES profile(id)
    ON UPDATE CASCADE ON DELETE CASCADE
)

INSERT INTO comentarios(
    id, 
    post_id,
    profile_id,
    content
) VALUES (
    '0dea1991-6c55-401a-8ccb-4ac49afd4588',
    'f5b25e8f-604c-420e-9a42-52548c61a41c',
    '2d2bb032-4a02-4ede-8925-49e9ae7ef71d',
    'AMOOOOOOOOO VALORANT ❤️'
);


-- SELECIONA POSTS E COMENTARIOS TUDO JUNTO
SELECT * 
FROM posts 
INNER JOIN comentarios ON posts.id = comentarios.post_id;
CREATE TABLE likes_or_dislikes(
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    post_id TEXT NOT NULL,
    value BLOB DEFAULT 1,
    profile_likeante_id TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('NOW')),
    FOREIGN KEY (post_id) REFERENCES posts(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (profile_likeante_id) REFERENCES profile(id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ;

DROP table likes_or_dislikes;

INSERT INTO 
likes_or_dislikes(
    id,
    post_id,
    profile_likeante_id,
    value 
)VALUES (
    "262a293d-184a-4d72-b53c-f3555fd1c5fd",
        'f5b25e8f-604c-420e-9a42-52548c61a41c',
    '2d2bb032-4a02-4ede-8925-49e9ae7ef71d',
    1
);


SELECT * from likes_or_dislikes;

CREATE TABLE criador_de_conteudo (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    nickname TEXT
);

CREATE TABLE conteudo_midia (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    titulo TEXT NOT NULL,
    url_conteudo TEXT NOT NULL, 
    criador_de_conteudo_id TEXT NOT NULL,
    FOREIGN KEY (criador_de_conteudo_id) REFERENCES criador_de_conteudo (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


DROP TABLE  usuarios;