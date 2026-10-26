-- 02b_senhas_bcrypt.sql
-- Troca as senhas em TEXTO CLARO da carga (02_carga.sql) por hash BCrypt com sal (B5: nunca guardar senha em texto claro).
-- Necessario porque a aplicacao Spring valida o login com BCryptPasswordEncoder.matches(); com senha em texto claro nenhum usuario da carga consegue entrar.
-- Execute DEPOIS do 02_carga.sql. A senha de cada usuario continua a mesma da carga (ex.: daniel.santos -> senha001).
-- Cada linha tem um sal diferente (o hash faz parte do proprio texto: $2a$10$<sal><hash>).
USE marketplace_db;

UPDATE tb_user SET password = '$2a$10$/E6sWXad/ajRyc1Q5TdKiuW67LyoC6YgD/os1NaQBcWHdJSPlnvHC' WHERE user = 'daniel.santos';
UPDATE tb_user SET password = '$2a$10$nr23nCzhf0IYlcfwZ3t1uONT1ZqdI9HSI0f35h30zrZMgJZ6lgwBi' WHERE user = 'fernando.araujo';
UPDATE tb_user SET password = '$2a$10$mr5i8wqpOnkNYkANGGTpVOPwhT0UyqZEtexFyx6npspKqiGuz1dNm' WHERE user = 'larissa.cardoso';
UPDATE tb_user SET password = '$2a$10$/M6Vq4Os7gMapIEgkZOi6uPmHaMIVwd5zl3va2t1xLb5GrJ.Tv4be' WHERE user = 'gustavo.cavalcanti';
UPDATE tb_user SET password = '$2a$10$urr9I562KAKifc7Hm0Zeuun6Nx6UwiLo8NYde6mip.4ge.ijPl2t6' WHERE user = 'paulo.rodrigues';
UPDATE tb_user SET password = '$2a$10$FMXbkSiWwvRLA4xR/84yCe/cRdyNIyM5G1CUWNZNZEwyUZR0O7E0G' WHERE user = 'thiago.gomes';
UPDATE tb_user SET password = '$2a$10$VaMrJx80tuOIOaejrloMuOmdJ5JuNrDwdxcHhSXqkVPkpLQrc0hu6' WHERE user = 'debora.correia';
UPDATE tb_user SET password = '$2a$10$E/JyEfGw13lTfBvurM5t0.NjH6fbAFxNVuaOndp3VYpc0iMrg1s.u' WHERE user = 'helena.oliveira';
UPDATE tb_user SET password = '$2a$10$sjFBojxLLi2tedf4YbtWY.cQmf161.jXqHjwoRK48/gPT8ow2PiBa' WHERE user = 'eduardo.lima';
UPDATE tb_user SET password = '$2a$10$QMFfRdUi7L2MZQ4Tvf2xV.CPuYaH3Fr6fffYC384HWic9Q8XisY5.' WHERE user = 'guilherme.barbosa';
UPDATE tb_user SET password = '$2a$10$piedKX72X84dT3811hmDUO.LFZD.NUXURtrm1GE7K66FzNO8QuIKe' WHERE user = 'isabela.campos';
UPDATE tb_user SET password = '$2a$10$xQRz3jRc3lg0adDfdZKfjuwcUc6Q1xtD.2pG2rC4hsvV/nN6V7siW' WHERE user = 'marcos.costa';
UPDATE tb_user SET password = '$2a$10$Gd7NSlftZ1t2WSlr05STz.ixuYQgIXiFfiGe9g1TSgczQqvDP5InC' WHERE user = 'yasmin.carvalho';
UPDATE tb_user SET password = '$2a$10$6NQkXthiOnUdp8P4aDHY3enVKr1lthfuwqPjL06b3rF.Fdq33mDy6' WHERE user = 'sergio.moreira';
UPDATE tb_user SET password = '$2a$10$Yp.2uNr9tb06XvwI.douo.YzPkV.mIqIbiYhJ9Seg1WLlVZU9DlGW' WHERE user = 'rodrigo.souza';
UPDATE tb_user SET password = '$2a$10$TidcrdwVfE1P7D0KQrSA4OtILs3S6NXLjKsAEfYDDgWelrhEX/B6O' WHERE user = 'gabriela.nascimento';
UPDATE tb_user SET password = '$2a$10$56p4htXHHcn6WwaDXjvz3uPsHOnFMFZWNhmoUQB8WOfgzmiieKf5m' WHERE user = 'beatriz.rocha';
UPDATE tb_user SET password = '$2a$10$VjvfcHB39xpHtodhKW.DCOKBgEIJk/vnJxbhvHXKHN7LiiHP2VSc.' WHERE user = 'natalia.castro';
UPDATE tb_user SET password = '$2a$10$IRWdCWyKRTh.HCDo6zMRvuf35ZW/BSNIkONnIDNgepRco2x.NbG2G' WHERE user = 'patricia.pereira';
UPDATE tb_user SET password = '$2a$10$HB973OlBY2.a9kDpz/HsZOUuq8z93sZRvrch1GIEb9A06o51utsqK' WHERE user = 'elaine.ribeiro';
UPDATE tb_user SET password = '$2a$10$HS1TQ6EGOMO6ywCpbsV2m.FUeU6e5s88VDG5dOmoljAm070Bd1KW6' WHERE user = 'vinicius.teixeira';
UPDATE tb_user SET password = '$2a$10$ytNq6IeKGqj3RWPsryocqOESGTrGx6AojQnLz2L6XXwZwm3WF2trO' WHERE user = 'ana.silva';
UPDATE tb_user SET password = '$2a$10$0FLbthpo2amTpMRFo3rQ8e/3au0fNX06SOjqo8EyCAkk75Fm/AhSu' WHERE user = 'alexandre.almeida';
UPDATE tb_user SET password = '$2a$10$ydAxtcmu0hc9x8Xu4Tbep.Q7UuajtjUFn/3TlA63lSjzeo1l76g4i' WHERE user = 'ricardo.martins';
UPDATE tb_user SET password = '$2a$10$8Bsca9p8ZtmpYv9sAXEcmeZjzKcWN4AkjD13vtxXsHZZXhTIX7cXO' WHERE user = 'fernanda.dias';
UPDATE tb_user SET password = '$2a$10$twKvMRhigCNguF7Hmlk/4.Pdd2OTMaIPFMGTTuHA4CKTH9vndhshu' WHERE user = 'sabrina.santos';
UPDATE tb_user SET password = '$2a$10$8zvka9yogdGnclc2DbGJde86LJWWL5rYxkMGEUpa0WgPLD/DFY31m' WHERE user = 'valter.araujo';
UPDATE tb_user SET password = '$2a$10$.6N6x1zrLxKMm92ooS1tLe8hWlu0UhqWjiyUhC5D3yBMpWfKTgwZK' WHERE user = 'renato.cardoso';
UPDATE tb_user SET password = '$2a$10$Iq73phza3TxLXGM8M0twou8inUpO1CXcT.eNGTPgjm2qOS6ynpQcy' WHERE user = 'andre.cavalcanti';
UPDATE tb_user SET password = '$2a$10$chjYp9kSR4cJqLdhbKSPae/0ndxZmm5xT8xTdBBiMn40zv/26tljO' WHERE user = 'vanessa.rodrigues';
UPDATE tb_user SET password = '$2a$10$BffiaJO0ZxC9rWXHKqBM7OdMl18hqxRQnMNa4UBXk/QFepo.HWsfu' WHERE user = 'mariana.gomes';
UPDATE tb_user SET password = '$2a$10$8HwzJxjuC7F48cz13CRjVOfS0IQY3GZfsLjdqwHsUks0qkdsCAc/e' WHERE user = 'karina.correia';
UPDATE tb_user SET password = '$2a$10$HRLeeQewnkqOR53/mHdQ3OtUYSHIhH90YGMCIMxVmGbuZPkBUdXcW' WHERE user = 'tatiane.oliveira';
UPDATE tb_user SET password = '$2a$10$15X/TrbOlWbAe7QaWRy07O2vEgUAo1LfUu8D0EvfmnRia3qIj9JFm' WHERE user = 'luis.lima';
UPDATE tb_user SET password = '$2a$10$.rp/PLgGFmgRxEdtG0HHRuTvXwkLmjFg4kUgnPJ4d4H7ZxfQQZfXm' WHERE user = 'camila.barbosa';
UPDATE tb_user SET password = '$2a$10$6z5ha7RMiw208ZdNRdVGSe3TZCOq7TkBob46fMbpF0QfFkpiRKocG' WHERE user = 'bruno.campos';
UPDATE tb_user SET password = '$2a$10$SXz/HCkQmrYiJ2FRyu7xNucuo2bVqYVcy7W5dxd0l0sxZADPV4IDK' WHERE user = 'juliana.costa';
UPDATE tb_user SET password = '$2a$10$jciWThYwTSqiIawTH8WKxuAzlKXZ2kghExQMsB92hGgUtAmCvNbtW' WHERE user = 'rafael.carvalho';
UPDATE tb_user SET password = '$2a$10$d4ktdAHOsKNVyOkRS96ZQ.NPHvTXCwMdvtvcdAveUp4FcJDeislQK' WHERE user = 'felipe.moreira';
UPDATE tb_user SET password = '$2a$10$jUk6mwMFTxYjc6N0QprofeFsBFh8OKvis0UWexjJJQ5kBL9cp7ERi' WHERE user = 'leonardo.souza';
UPDATE tb_user SET password = '$2a$10$ohELO9Wn0VFY8p8MRWCMbOir0F.IgHqG9QcDCcvKxE0tcg3LgUSaG' WHERE user = 'fabio.nascimento';
UPDATE tb_user SET password = '$2a$10$kJdYLe/5XIwxW3JaQj/3S.rQUyXqAxZ9/SJJ/Cmg2QO857Uz.w30e' WHERE user = 'carlos.rocha';
UPDATE tb_user SET password = '$2a$10$sb4dtnWJz8gOkd59F9BAXO9QrcA5YAHBkQFRrCll1fZZkkeUrqKJm' WHERE user = 'ewerthon.castro';
UPDATE tb_user SET password = '$2a$10$qlTxHESg.RmbzFIi5eXSd.PxUgBSWQ7mqmUUAadE08UiP8P3mjOYy' WHERE user = 'diego.pereira';
UPDATE tb_user SET password = '$2a$10$xVRcLck0yCbBsl5jR.5AOOTkwu.bTSuqByMZaktZnFPm0t/nrJYm2' WHERE user = 'raquel.ribeiro';
