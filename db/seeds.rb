# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
%w[
  https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200108040342-glacier-national-park.jpg
  https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.travelandleisure.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F1600x1000%2Fpublic%2F1578588744%2Fglacier-national-park-GLACIERSIGNS0120.jpg%3Fitok%3DCXfb9mW9&w=400&c=sc&poi=face&q=85
  https://ewscripps.brightspotcdn.com/dims4/default/80942cf/2147483647/strip/true/crop/1280x720+0+0/resize/1280x720!/quality/90/?url=https%3A%2F%2Fewscripps.brightspotcdn.com%2F4c%2F8b%2F16526a044f64b430e2f8c1798292%2Fkr00003.jpg
  https://s27363.pcdn.co/wp-content/uploads/2019/08/Highline-Trail.jpg.optimal.jpg
  http://www.hikinginglacier.com/glacier_photos/highline/highline-trail-view.jpg
  https://images.squarespace-cdn.com/content/v1/558c4442e4b00dc67b7f24a9/1469295593771-CIKMMAY6KRIRJ2J7311U/ke17ZwdGBToddI8pDm48kOggE0Ch6pMGalwtLMqzsSB7gQa3H78H3Y0txjaiv_0fgkxBWjjRb1N_UxbACPPq6hhC5MerhNR9r2hvFzptSmFBP4j2ZMngv5acyYAR_NT0OqpeNLcJ80NK65_fV7S1UW7zdFGZklDchF5ArlaSUrCRqgW09tIHM6IlKpmHNg6OnvDAEkOjC6oNMG0zMsNICg/image-asset.jpeg?format=1500w
  https://www.themandagies.com/wp-content/uploads/2019/09/iceberg-lake-trail-glacier-national-park-montana-the-mandagies-71-1500x1000.jpg
  https://www.themandagies.com/wp-content/uploads/2019/09/iceberg-lake-trail-glacier-national-park-montana-the-mandagies-31-1500x1000.jpg
  https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/the-garden-wall-glacier-national-park-andrew-lillibridge.jpg
  http://i.cdn.turner.com/cnn/2010/TRAVEL/08/03/glacier.national.park/t1larg.glacier.nps.jpg
  https://i2.wp.com/glacierguides.com/wp-content/uploads/2017/02/16130805110_2acebe8eb3_k.jpg?ssl=1
  https://www.yellowstonepark.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTQ5NjgyMzkyMzMwNjc2MDI2/gl-many-glacier-hotel_flickrtedbuckner_1600.jpg
  https://mediaassets.kpax.com/cordillera-network/wp-content/uploads/sites/13/2018/10/23202819/Glacier-Natonal-Park-1024x585.jpg
  https://www.usnews.com/dims4/USNEWS/877c408/2147483647/thumbnail/640x420/quality/85/?url=https%3A%2F%2Fmedia.beam.usnews.com%2Fa7%2F00%2F68a9722f4da48b229e5e550df7ed%2F161028-glaciernatlpark-stock.jpg
  https://vetvacationce.com/wp-content/uploads/2019/07/56_89_large.jpg
  https://www.yellowstonepark.com/.image/t_share/MTU1MjcyMTc5MjU1MDkzMjQy/moose-glacier_npstimrains_700.jpg
  https://c402277.ssl.cf1.rackcdn.com/photos/3339/images/blog_media_carousel/black_bear_cub.jpg?1357650259
  https://www.yellowstonepark.com/.image/t_share/MTU1MjcyMDkzODkyODgwMjc5/bighorn-glaciernp_tamkimjohnston_700.jpg
  https://c402277.ssl.cf1.rackcdn.com/photos/3336/images/blog_media_carousel/big_horn_sheep.jpg?1357619628
  https://media.gannett-cdn.com/44692040001/44692040001_5539115479001_5539107137001-vs.jpg?pubId=44692040001
].each do |image_url|
  Image.create(url: image_url, tag_list: 'Glacier National Park, Outdoors')
end
