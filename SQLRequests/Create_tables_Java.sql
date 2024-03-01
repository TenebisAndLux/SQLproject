-- Создание Таблицы Роль
create table role
(
    id    NUMBER
        CONSTRAINT PK_ROLE PRIMARY KEY,
    title varchar2(30) NOT NULL
);
--
-- -- Создание таблицы Статус заявки
create table request_status
(
    id    NUMBER
        CONSTRAINT PK_REQUEST_STATUS PRIMARY KEY,
    title varchar2(50) NOT NULL
);

-- Создание таблицы Пользователь
create table users
(
    id         NUMBER GENERATED ALWAYS as IDENTITY (START with 1 INCREMENT by 1)
        CONSTRAINT PK_USERS PRIMARY KEY,
    login      varchar2(50) UNIQUE    NOT NULL,
    password   varchar2(20)           NOT NULL,
    name       varchar2(20)           NOT NULL,
    surname    varchar2(20)           NOT NULL,
    role       NUMBER       default 1 NOT NULL,
    is_deleted NUMBER(1, 0) DEFAULT 0,
    CONSTRAINT FK_ROLE
        FOREIGN KEY (role)
            references role (id)
);
--
-- -- Создание таблицы Токен
create table token
(
    id         NUMBER GENERATED ALWAYS as IDENTITY (START with 1 INCREMENT by 1)
        CONSTRAINT PK_TOKEN PRIMARY KEY,
    user_id    NUMBER,
    token      VARCHAR2(255) NOT NULL,
    expires_at TIMESTAMP     NOT NULL,
    is_deleted NUMBER(1, 0) DEFAULT 0 CHECK (is_deleted IN (0, 1)),
    CONSTRAINT FK_USER
        FOREIGN KEY (user_id)
            references users (id)
);
--
-- -- Создание таблицы Запрос к эксперту
create table expert_request
(
    id        NUMBER GENERATED ALWAYS as IDENTITY (START with 1 INCREMENT by 1)
        CONSTRAINT PK_EXPERT_REQUEST PRIMARY KEY,
    expert_id NUMBER,
    leader_id NUMBER,
    status    NUMBER,
    CONSTRAINT FK_EXPERT
        FOREIGN KEY (expert_id)
            references users (id),
    CONSTRAINT FK_LEADER
        FOREIGN KEY (leader_id)
            references users (id),
    CONSTRAINT FK_STATUS
        FOREIGN KEY (status)
            references request_status (id)
);

-- Создание таблицы Команда

create table team
(
    id          NUMBER GENERATED ALWAYS as IDENTITY (START with 1 INCREMENT by 1)
        CONSTRAINT PK_TEAM PRIMARY KEY,
    leader_id   NUMBER,
    title       varchar2(50) NOT NULL,
    description varchar2(255) NOT NULL,
    created_at  date,
    member_count NUMBER,
    CONSTRAINT FK_TEAM_LEADER
        FOREIGN KEY (leader_id)
            references users (id)
            ON DELETE CASCADE
);

-- Создание таблицы Член команды

create table team_member
(
    team_id NUMBER,
    user_id NUMBER,
    CONSTRAINT FK_TEAM
        FOREIGN KEY (team_id)
            references team (id)
            ON DELETE CASCADE,
    CONSTRAINT FK_TEAM_USER
        FOREIGN KEY (user_id)
            references users (id)
            ON DELETE CASCADE
);

-- Создание таблицы Запрос на вступление в команду

create table team_join_request
(
    id NUMBER GENERATED ALWAYS as IDENTITY (START with 1 INCREMENT by 1)
        CONSTRAINT PK_TEAM_JOIN_REQUEST PRIMARY KEY,
    team_id NUMBER,
    user_id NUMBER,
    request_status NUMBER(1, 0) DEFAULT 0 CHECK (request_status IN (0, 1)),
    CONSTRAINT FK_TEAM_JOIN
        FOREIGN KEY (team_id)
            references team (id)
            ON DELETE CASCADE,
    CONSTRAINT FK_USER_JOIN
        FOREIGN KEY (user_id)
            references users (id)
            ON DELETE CASCADE
);

-- Создание таблицы максимальное количество команд для консультации экспертом
create table max_expert_count (
    expert_id NUMBER,
    max_team_count NOT NULL,
    CONSTRAINT FK_EXPERT
        FOREIGN KEY (expert_id)
            references users (id)
            ON DELETE CASCADE
)