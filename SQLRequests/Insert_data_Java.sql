-- Заполнение таблицы Роль
insert into ROLE(ID, TITLE)
values (1, 'Пользователь');
insert into ROLE(ID, TITLE)
values (2, 'Эксперт');
insert into ROLE(ID, TITLE)
values (3, 'Администратор');

-- Заполнение таблицы Статус заявки
insert into REQUEST_STATUS(ID, TITLE)
VALUES (1, 'Консультация оказана');
insert into REQUEST_STATUS(ID, TITLE)
VALUES (2, 'В консультации отказано');
insert into REQUEST_STATUS(ID, TITLE)
VALUES (3, 'В ожидании');

-- Заполнение таблицы Пользователь
insert into USERS(LOGIN, PASSWORD, NAME, SURNAME)
VALUES ('alex@mail.ru', '123', 'Алексей', 'Тимофеев');
insert into USERS(LOGIN, PASSWORD, NAME, SURNAME)
VALUES ('mattew@mail.ru', '123', 'Матвей', 'Аверкин');
insert into USERS(LOGIN, PASSWORD, NAME, SURNAME)
VALUES ('andrew@mail.ru', '123', 'Андрей', 'Стаховский');
insert into USERS(LOGIN, PASSWORD, NAME, SURNAME)
VALUES ('tim@mail.ru', '123', 'Тимофей', 'Аверин');
insert into USERS(LOGIN, PASSWORD, NAME, SURNAME)
VALUES ('sergio@mail.ru', '123', 'Сергей', 'Горбенко');

-- Заполнение таблицы Команды
insert into TEAM(LEADER_ID, TITLE, DESCRIPTION, CREATED_AT)
VALUES (1, 'Новый Спотифай',
        'Проект разработки Спотифая. Яндекс музыка нам надоела, поэтому делаем немного круче. Подписки, новые альбомы тут.',
        CURRENT_TIMESTAMP);
insert into TEAM(LEADER_ID, TITLE, DESCRIPTION, CREATED_AT)
VALUES (2, 'Новый сайт РЖД', 'Проект разработки нового сайта РЖД.', CURRENT_TIMESTAMP);
insert into TEAM(LEADER_ID, TITLE, DESCRIPTION, CREATED_AT)
VALUES (3, 'Новый сайт Тинькофф', 'Проект разработки нового сайта Тинькофф.', CURRENT_TIMESTAMP);
insert into TEAM(LEADER_ID, TITLE, DESCRIPTION, CREATED_AT)
VALUES (4, 'Новый сайт Microsoft', 'Проект разработки нового сайта Майкрософт.', CURRENT_TIMESTAMP);
insert into TEAM(LEADER_ID, TITLE, DESCRIPTION, CREATED_AT)
VALUES (5, 'Новый сайт Zeekr', 'Проект разработки сайта Zeekr. Новый бренд электромобилей с корнями из Швеции.',
        CURRENT_TIMESTAMP);

-- Заполнение таблицы Участник команды
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (1, 1);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (1, 3);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (2, 2);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (2, 4);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (3, 3);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (3, 5);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (4, 4);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (4, 1);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (5, 5);
INSERT INTO TEAM_MEMBER(team_id, user_id)
VALUES (5, 2);

-- Заполнение таблицы Запрос на вступление в команду
INSERT INTO TEAM_JOIN_REQUEST(TEAM_ID, USER_ID)
VALUES (1, 4);
INSERT INTO TEAM_JOIN_REQUEST(TEAM_ID, USER_ID)
VALUES (2, 3);
INSERT INTO TEAM_JOIN_REQUEST(TEAM_ID, USER_ID)
VALUES (3, 4);
INSERT INTO TEAM_JOIN_REQUEST(TEAM_ID, USER_ID)
VALUES (4, 3);
INSERT INTO TEAM_JOIN_REQUEST(TEAM_ID, USER_ID)
VALUES (5, 1);