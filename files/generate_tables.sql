CREATE TABLE  el."twords" ( 
    id serial not null,
    code numeric[10] not null,
    val varchar[40] not null,
    CONSTRAINT pk_twords PRIMARY KEY(id),
    CONSTRAINT uk_code_twords UNIQUE(code),
    CONSTRAINT uk_val_twords UNIQUE(val)
);

CREATE TABLE el."dict" (
    id serial not null,
    code numeric[10] not null,
    id_twords integer not null,
    CONSTRAINT pk_dict PRIMARY KEY(id),
    CONSTRAINT uk_code_dict UNIQUE(code),
    CONSTRAINT fk_twords_dict FOREIGN KEY(id_twords) REFERENCES el."twords"
);
   
CREATE TABLE el."words" (
    id serial not null,
    code numeric[10] not null,
    val varchar[40] not null,
 	id_dict integer not null,
    CONSTRAINT pk_words PRIMARY KEY(id),
    CONSTRAINT uk_code_words UNIQUE(code),
    CONSTRAINT uk_val_words UNIQUE(val),
    CONSTRAINT fk_dict FOREIGN KEY(id_dict) REFERENCES el."dict"
);


CREATE TABLE el."tkwords" (
	id smallserial not null,
	val varchar[15] not null,
	CONSTRAINT pk_tkwords PRIMARY KEY(id),
	CONSTRAINT uk_tk_words UNIQUE(val)
);

CREATE TABLE el."kwords" (
	id smallserial not null,
	val varchar[15] not null,
	id_tkwords smallint not null,
	CONSTRAINT pk_kwords PRIMARY KEY(id),
	CONSTRAINT fk_tkwords_kwords FOREIGN KEY(id_tkwords) REFERENCES el."tkwords"
);    

CREATE TABLE el."sentc" (
	id serial not null,
	id_word int not null,
	sorder smallint not null,
	CONSTRAINT pk_sentc PRIMARY KEY(id),
	CONSTRAINT fk_words_sentc FOREIGN KEY(id_word) REFERENCES el."words"
);

CREATE TABLE el."quest"(
	id serial not null,
	code numeric[10] not null,
	id_sentc int not null,
	id_kword smallint not null,
	CONSTRAINT pk_questions PRIMARY KEY(id),
	CONSTRAINT uk_code_questions UNIQUE(code),
	CONSTRAINT fk_sentc_quest FOREIGN KEY(id_sentc) REFERENCES el."sentc",
	CONSTRAINT fk_kword_quest FOREIGN KEY(id_kword) REFERENCES el."kwords"
);

CREATE TABLE el."answs" (
	id bigserial not null,
	code numeric[10] not null,
	id_sentc integer not null,
	id_quest integer not null,
	aright boolean default false,
	CONSTRAINT uk_code_answs UNIQUE(code),
	CONSTRAINT fk_sentc_answs FOREIGN KEY(id_sentc) REFERENCES el."sentc",
	CONSTRAINT fk_quest_answs FOREIGN KEY(id_quest) REFERENCES el."quest"
);

COMMENT ON TABLE el."dict" IS 'Table contain translation of english for portuguese';
COMMENT ON TABLE el."answs" IS 'Table contain the answers for the questions, the field arigth says if the answer is correct';
COMMENT ON TABLE el."kwords" IS 'Table contain the key words that made the question for example';
COMMENT ON TABLE el."quest" IS 'Table contain the questions, the key words are required';
COMMENT ON TABLE el."sentc" IS 'Table contain the sentences, each sentence is made of one group of words';
COMMENT ON TABLE el."tkwords" IS 'Table contain the kind of key words, how question for example.';
COMMENT ON TABLE el."twords" IS 'Table contain all the translations for the words, only for portuguese.';
COMMENT ON TABLE el."words" IS 'Table contain all the words that will be show in the application.';

