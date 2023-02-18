# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[
  africas ahriman akashiro_yulice azto_dio bigrbear blondy camonome catstudio chaesu darumasan ddal
  denkitori digele dpin edendenoden eto ez6 fadingz fkey gogalking green_tea_neko gusu
  ha_ku_ronofu_jin hitomio16 hjl honghonghong hs225kr iskanderednaksi kittichai_rueangchaichan_razaras
  koronda kuroyagi kurusu_tatsuya lemontyoisy_r18 liren44 luiferblack maachin machino_henmaru mdf_an
  messsss mignon minjkim momonoko_noko monikano moshimoshibe murakami_suigun nekodayo22 norizou_type_r
  orange_bullet personalami porforever shibu11 shiers_web tabhead takuteks tokinohimitsu yewang19
  ying_lee yohan1754 yui_toshiki
].each do |name|
  Author.create(name:)
end

%w[].each do |name|
  Character.create(name:)
end

%w[art photo anime_video real_video].each do |name|
  Media.create(name:)
end

%w[unknown_origin game series movie cartoon anime hentai comic manga].each do |name|
  Origin.create(name:)
end

%w[unknown_rating safe questionable nsfw].each do |name|
  Rating.create(name:)
end

{
  'nsfw'          => %w[
                    aftersex anilingus anus ass
                    bdsm bestiality breasts
                    cunnilingus
                    demonstrating double_penetration
                    ejaculation_female ejaculation_male enema
                    fellatio fingering fisting
                    lingerie
                    masturbation
                    nude
                    object_insertion
                    penetration_cervical penetration_urethral public pussy
                    sex sex_toy
                    shibari spread_legs stomach_bulge
                    tentacles towel
                    yuri
                  ],
  'questionable'  => %w[belly bunnysuit collar kiss swimsuit wet_clothes],
  'safe'          => %w[
                    cosplay elf kemonomimi kemonomimi_fake maid miko minigirl
                    monmusu monochrome santa school_uniform sportswear
                  ],
}.each do |parent, children|
  children.each do |name|
    Other.create(name:, parent: Rating.find_by(name: parent))
  end
end

{
  'enema'           => %w[enema_anal enema_vaginal],
  'fingering'       => %w[fingering_anal fingering_both fingering_vaginal],
  'fisting'         => %w[fisting_anal fisting_both fisting_vaginal],
  'lingerie'        => %w[bra cat_keyhole pants],
  'nude'            => %w[nude_completely nude_partly],
  'object_insertion'=> %w[object_insertion_anal object_insertion_both object_insertion_vaginal],
  'sex'             => %w[sex_anal sex_public sex_vaginal],
  'sex_toy'         => %w[dildo sex_machine vibrator],
  'swimsuit'        => %w[bikini one_piece_swimsuit swimsuit_school],
}.each do |parent, children|
  children.each do |name|
    Other.create(name:, parent: Other.find_by(name: parent))
  end
end

%w[unknown_origin telegram discord pixiv artstation danbooru gelbooru rule34].each do |name|
  Source.create(name:)
end

%w[
  arknights legend_of_zelda nier_automata nier_replicant
  azur_lane dead_or_alive genshin_impact girls_frontline league_of_legends overwatch
  touhou blue_archive elden_ring goddes_of_viktory_nikke mario_bros
  persona vocaloid buhanochka endless_summer helltaker metroid pokemon_sword_and_shield
  vtubers cyberpunk final_fantasy kantai_collection witcher
].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'game'))
end

%w[
  amagami_ss attack_on_titan black_clover blend_s bocchi_the_rock boku_no_hero_academia chainsaw_man
  code_geass cyberpunk_edgerunners darling_in_franxx durarara en_en_shouboutai eromanga_sensei
  evangelion fate ganbare_douki_chan gotobun_no_hanayome guilty_crown gurren_lagann
  haruhi_suzumiya idolmaster isekai_ojisan k_on kaguya_sama_love_is_war kemono_friends
  kikis_delivery_service kill_la_kill kimetsu_no_yaiba kobayashi_san_no_maid_chi
  komi_san_wa_komyushou konosuba kumo_desu_ga_nani_ka lucky_star lycoris_recoil machikado_mazoku
  made_in_abuss mahou_shoujo_madoka_magica majo_no_tabi manaria_friends mirai_nikki
  monster_musume_no_iru_nichijou monogatari mushoku_tensei no_game_no_life one_piece onepunchman
  oreimo overlord pandora_hearts princess_connect re_zero saikin_yatotta_meido_ga_ayashii
  sakurasou_no_pet_na_kanojo sword_art_online seibuta seilor_moon senko_san_helpful_fox shaman_king
  sono_bisque_doll_wa_koi_wo_suru sora_no_otoshimono soul_eater spice_and_wolf spy_x_family steins_gate
  tate_no_yuusha_no_nariagari tensura to_love_ru to_aru_kagaku_no_railgun to_aru_majutsu_no_index
  toradora utawarerumono uzaki_chan_wa_asobitai violett_evergarden yuru_yuri zero_kara_hajimeru_no_maho_sho
].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'anime'))
end

%w[
  avatar_the_last_airbender avatar_the_legend_of_korra my_little_pony rwby scooby_doo
].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'cartoon'))
end

%w[book_about_making_out_with_a_kemonomimi_maid].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'manga'))
end

%w[kaede_and_suzu kanojo_x_kanojo_x_kanojo].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'hentai'))
end

%w[dc].each do |name|
  Source.create(name:, parent: Media.find_by(name: 'movie'))
end
