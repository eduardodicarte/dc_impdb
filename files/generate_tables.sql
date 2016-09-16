CREATE TABLE el."rule" (
  id serial not null,
  code bytea not null,
  name varchar[60] not null,
  val varchar[40] not null,
  CONSTRAINT pk_rule PRIMARY KEY(id),
  CONSTRAINT uk_code_rule UNIQUE(code)
);

CREATE TABLE el."gender" (
  id smallserial not null,
  code bytea not null,
  als varchar[20] not null,
  CONSTRAINT pk_gender PRIMARY KEY(id),
  CONSTRAINT uk_code_gender UNIQUE(code)
);

CREATE TABLE  el."translation" (
  id serial not null,
  code bytea not null,
  val varchar[80] not null,
  id_gender smallint not null,
  CONSTRAINT pk_transl PRIMARY KEY(id),
  CONSTRAINT uk_code_transl UNIQUE(code),
  CONSTRAINT uk_val_transl  UNIQUE(val),
  CONSTRAINT fk_gender_translation FOREIGN KEY(id_gender) REFERENCES el."gender"
);

CREATE TABLE el."exception" (
  id smallserial not null,
  code bytea not null,
  name varchar[60] not null,
  val varchar [80] not null,
  CONSTRAINT pk_exception PRIMARY KEY(id),
  CONSTRAINT uk_code_exception UNIQUE(code),
  CONSTRAINT uk_name_exception UNIQUE(name)
);

CREATE TABLE el."word" (
  id serial not null,
  code bytea not null,
  val varchar[80] not null,
  CONSTRAINT pk_word PRIMARY KEY(id),
  CONSTRAINT uk_code_word UNIQUE(code),
  CONSTRAINT uk_val_word  UNIQUE(val)
);

CREATE TABLE el."ruleswd" (
  id serial not null,
  code bytea not null,
  id_rule int not null,
  id_word smallint not null,
  id_exception smallint not null,
  CONSTRAINT pk_ruleswd PRIMARY KEY(id),
  CONSTRAINT uk_code_ruleswd UNIQUE(code),
  CONSTRAINT uk_name_ruleswd UNIQUE(code),
  CONSTRAINT fk_rule_ruleswd FOREIGN KEY(id_rule) REFERENCES el."rule",
  CONSTRAINT fk_word_ruleswd FOREIGN KEY(id_word) REFERENCES el."word",
  CONSTRAINT fk_exception_ruleswd FOREIGN KEY(id_exception) REFERENCES el."exception"
);

CREATE TABLE el."verb" (
  id serial not null,
  code bytea not null,
  val  varchar[80] not null,
  CONSTRAINT pk_verb PRIMARY KEY(id),
  CONSTRAINT uk_code_verb UNIQUE(code),
  CONSTRAINT uk_val_verb  UNIQUE(val)
);

CREATE TABLE el."rulesvb" (
  id serial not null,
  code bytea not null,
  id_rule int not null,
  id_verb int not null,
  id_exception smallint not null,
  CONSTRAINT pk_rulesvb PRIMARY KEY(id),
  CONSTRAINT uk_code_rulesvb UNIQUE(code),
  CONSTRAINT uk_name_rulesvb UNIQUE(name),
  CONSTRAINT fk_rule_rulesvb FOREIGN KEY(id_rule) REFERENCES el."rule",
  CONSTRAINT fk_verb_rulesvb FOREIGN KEY(id_verb) REFERENCES el."verb",
  CONSTRAINT fk_exception_rulesvb FOREIGN KEY(id_exception) REFERENCES el."exception"
);

CREATE TABLE el."noun" (
  id   serial not null,
  code bytea not null,
  val  varchar[80] not null,
  CONSTRAINT pk_noun PRIMARY KEY(id),
  CONSTRAINT uk_code UNIQUE(code),
  CONSTRAINT uk_val_noun UNIQUE(val)
);

CREATE TABLE el."rulesnn" (
  id serial not null,
  code bytea not null,
  name varchar[60] not null,
  id_rule int not null,
  id_noun int not null,
  id_exception smallint not null,
  CONSTRAINT pk_rulesnn PRIMARY KEY(id),
  CONSTRAINT uk_code_rulesnn UNIQUE(code),
  CONSTRAINT uk_name_rulesnn UNIQUE(name),
  CONSTRAINT fk_rule_rulesnn FOREIGN KEY(id_rule) REFERENCES el."rule",
  CONSTRAINT fk_noun_rulesnn FOREIGN KEY(id_noun) REFERENCES el."noun",
  CONSTRAINT fk_exception_rulesnn FOREIGN KEY(id_exception) REFERENCES el."exception"
);

CREATE TABLE el."preposition" (
  id serial not null,
  code bytea not null,
  val  varchar[60] not null,
  CONSTRAINT pk_preposition PRIMARY KEY(id),
  CONSTRAINT uk_code_preposition UNIQUE(code),
  CONSTRAINT uk_val_preposition UNIQUE(val)
);

CREATE TABLE el."tkeyword" (
  id smallserial not null,
  code bytea not null,
  name varchar[40] not null,
  val varchar[60] not null,
  CONSTRAINT pk_tkeyword PRIMARY KEY(id),
  CONSTRAINT uk_code_tkeyword UNIQUE(code),
  CONSTRAINT uk_name_tkeyword UNIQUE(name)
);

CREATE TABLE el."keyword" (
  id smallserial not null,
  code bytea not null,
  val varchar[15] not null,
  id_tkeyword smallint not null,
  CONSTRAINT pk_keyword PRIMARY KEY(id),
  CONSTRAINT uk_code_keyword UNIQUE (code),
  CONSTRAINT uk_val_keyword UNIQUE(val),
  CONSTRAINT fk_tkeyword_keyword FOREIGN KEY(id_tkeyword) REFERENCES el."tkeyword"
);

CREATE TABLE el."ruleskw" (
  id serial not null,
  code bytea not null,
  id_rule smallint not null,
  id_keyword smallint not null,
  id_exception smallint not null,
  CONSTRAINT pk_ruleskw PRIMARY KEY(id),
  CONSTRAINT uk_code_ruleskw UNIQUE(code),
  CONSTRAINT uk_name_ruleskw UNIQUE(name),
  CONSTRAINT fk_rule_ruleskw FOREIGN KEY(id_rule) REFERENCES el."rule",
  CONSTRAINT fk_keyword_ruleskw FOREIGN KEY(id_keyword) REFERENCES el."keyword",
  CONSTRAINT fk_exception_ruleskw FOREIGN KEY(id_exception) REFERENCES el."exception"
);

CREATE TABLE el."number" (
  id smallserial not null,
  code bytea not null,
  val varchar[15] not null,
  CONSTRAINT pk_number PRIMARY KEY(id),
  CONSTRAINT uk_code_number UNIQUE(code),
  CONSTRAINT uk_val_number  UNIQUE(val)
);

CREATE TABLE el."adjective" (
  id serial not null,
  code bytea not null,
  val varchar[80] not null,
  CONSTRAINT pk_adjective PRIMARY KEY(id),
  CONSTRAINT uk_code_adjective UNIQUE(code),
  CONSTRAINT uk_val_adjective  UNIQUE(val)
);

CREATE TABLE el."pronoun" (
  id smallserial not null,
  code bytea not null,
  val varchar[80] not null,
  CONSTRAINT pk_pronoun PRIMARY KEY(id),
  CONSTRAINT uk_code_pronoun UNIQUE(code),
  CONSTRAINT uk_val_pronoun  UNIQUE(val)
);

CREATE TABLE el."answer" (
	id bigserial not null,
	code bytea not null,
	val  varchar[120] not null,
  CONSTRAINT pk_answer PRIMARY KEY(id),
	CONSTRAINT uk_code_answs UNIQUE(code)
);

CREATE TABLE el."question"(
	id bigserial not null,
	code bytea not null,
	val  varchar[120] not null,
	CONSTRAINT pk_quest PRIMARY KEY(id),
	CONSTRAINT uk_code_quest UNIQUE(code)
);

CREATE TABLE el."questionnaire" (
	id bigserial not null,
	code bytea not null,
  id_question bigint not null,
  id_answer   bigint not null,
	ranswer     boolean not null,
	CONSTRAINT pk_questionnaire PRIMARY KEY(id),
  CONSTRAINT uk_code_questionnaire UNIQUE(code),
	CONSTRAINT fk_quest_questionnaire FOREIGN KEY(id_question) REFERENCES el."question",
  CONSTRAINT fk_answer_questionnaire FOREIGN KEY(id_answer)  REFERENCES el."answer"
);

CREATE TABLE el."translwd" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_word int not null,
  CONSTRAINT pk_translwd PRIMARY KEY(id),
  CONSTRAINT uk_code_translwd UNIQUE(code),
  CONSTRAINT fk_translwd_translation FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_translwd_word FOREIGN KEY(id_word) REFERENCES el."word"
);

CREATE TABLE el."translvb" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_verb int not null,
  CONSTRAINT pk_translvb PRIMARY KEY(id),
  CONSTRAINT uk_code_translvb UNIQUE(code),
  CONSTRAINT fk_translvb_translation FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_translvb_verb FOREIGN KEY(id_verb) REFERENCES el."verb"
);

CREATE TABLE el."translkw" (
  id serial not null,
  code bytea not null,
  id_keyword smallint not null,
  id_translation int not null,
  CONSTRAINT pk_translkw PRIMARY KEY(id),
  CONSTRAINT uk_code_translkw UNIQUE(code),
  CONSTRAINT fk_translkw_keyword FOREIGN KEY(id_keyword) REFERENCES el."keyword",
  CONSTRAINT fk_translkw_translation FOREIGN KEY(id_translation) REFERENCES el."translation"
);

CREATE TABLE el."translnn" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_noun int not null,
  CONSTRAINT pk_translnn PRIMARY KEY(id),
  CONSTRAINT uk_code_transln UNIQUE(code),
  CONSTRAINT fk_transln_translation FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_transln_noun FOREIGN KEY(id_noun) REFERENCES el."noun"
);

CREATE TABLE el."translpp" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_preposition int not null,
  CONSTRAINT pk_translpp PRIMARY KEY(id_translation),
  CONSTRAINT uk_code_translpp UNIQUE(code),
  CONSTRAINT fk_translation FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_preposition FOREIGN KEY(id_preposition) REFERENCES el."preposition"
);

CREATE TABLE el."translnb" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_number smallint not null,
  CONSTRAINT pk_translnb PRIMARY KEY(id),
  CONSTRAINT uk_code_translnb UNIQUE(code),
  CONSTRAINT fk_translation FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_number      FOREIGN KEY(id_number) REFERENCES el."number"
);

CREATE TABLE el."transladj" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_adjective   int not null,
  CONSTRAINT pk_transladj PRIMARY KEY(id),
  CONSTRAINT uk_code_transladj UNIQUE(code),
  CONSTRAINT fk_transladj_transl FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_transladj_adj    FOREIGN KEY(id_adjective) REFERENCES el."adjective"
);

CREATE TABLE el."translpron" (
  id serial not null,
  code bytea not null,
  id_translation int not null,
  id_pronoun     int not null,
  CONSTRAINT pk_translpron PRIMARY KEY(id),
  CONSTRAINT uk_code_translpron UNIQUE(code),
  CONSTRAINT fk_translpron_transl FOREIGN KEY(id_translation) REFERENCES el."translation",
  CONSTRAINT fk_translpron_pronoun FOREIGN KEY(id_pronoun) REFERENCES el."pronoun"
);

COMMENT ON TABLE el."rule" IS 'Tabela contém as regras que devem ser aplicadas.';
COMMENT ON TABLE el."gender" IS 'Tabela que definirá se deverá existir uma tradução com o masculino e feminino.';
COMMENT ON TABLE el."translation" IS 'Tabela conterá as traduções para verbos, palavras, pronomes, adjetivos, substantivos.';
COMMENT ON TABLE el."word" IS 'Tabela conterá todas as palavras que não puderam ser classificadas como verbo, substantivo.';
COMMENT ON TABLE el."ruleswd" IS 'Tabela que relaciona as regras com as palavras.';
COMMENT ON TABLE el."verb" IS 'Tabela que conterá todos os verbos.';
COMMENT ON TABLE el."rulesvb" IS 'Tabela que relaciona as regras com os verbos.';
COMMENT ON TABLE el."noun" IS 'Tabela que conterá todos os substantivos.';
COMMENT ON TABLE el."rulesnn" IS 'Tabela que relaciona as regras com os substantivos.';
COMMENT ON TABLE el."preposition" IS 'Tabela que conterá todas as preposições';
COMMENT ON TABLE el."tkeyword" IS 'Tabela que conterá todos os tipos de palavras chaves (itens com poucos registros)';
COMMENT ON TABLE el."keyword" IS 'Tabela que conterá palavras que não tiveram uma tabela gerada, como conjunções, letters.';
COMMENT ON TABLE el."ruleskword" IS 'Tabela que relaciona as regras com as keywords.';
COMMENT ON TABLE el."number" IS 'Tabela que conterá a grafia dos números.';
COMMENT ON TABLE el."adjective" IS 'Tabela que conterá todos os adjetivos.';
COMMENT ON TABLE el."pronoun" IS 'Tabela que conterá todos os pronomes.';
COMMENT ON TABLE el."adjective" IS 'Tabela que conterá todos os adjetivos.';
COMMENT ON TABLE el."answer" IS 'Tabela que conterá todas as respostas.';
COMMENT ON TABLE el."question" IS 'Tabela que conterá todas as perguntas.';
COMMENT ON TABLE el."questionnaire" IS 'Tabela que relaciona as perguntas com as respostas, informando qual a resposta correta.';
COMMENT ON TABLE el."translwd" IS 'Tabela que relaciona a palavra com sua respectiva tradução';
COMMENT ON TABLE el."translvb" IS 'Tabela que relaciona o verbo com sua respectiva tradução';
COMMENT ON TABLE el."translkw" IS 'Tabela que relaciona a keyword com sua respectiva tradução';
COMMENT ON TABLE el."translnn" IS 'Tabela que relaciona o substantivo com sua respectiva tradução';
COMMENT ON TABLE el."translpp" IS 'Tabela que relaciona a preposição com sua respectiva tradução';
COMMENT ON TABLE el."translnb" IS 'Tabela que relaciona o número com sua respectiva tradução';
COMMENT ON TABLE el."transladj" IS 'Tabela que relaciona o adjetivo com sua respectiva tradução';
COMMENT ON TABLE el."translpron" IS 'Tabela que relaciona o pronome com sua respectiva tradução';
COMMENT ON TABLE el."exception" IS 'Tabela que conterá as exceções referente as regras que serão aplicadas no sistema';
