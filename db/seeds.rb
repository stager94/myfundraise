def generate_foto_path(title)
	Rails.root.join('public', 'temp', title).to_s
end



AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

currencies = Currency.create [{ name: "Рубли",   code: "RUB", sign: "&nbsp;<i class='f-currency'>Р</i>", 			 wallet_one_id: 643, sign_after_amount: true },
														  { name: "Доллары", code: "USD", sign: "$", 			 wallet_one_id: 840, sign_after_amount: false },
														  { name: "Евро",    code: "EUR", sign: "&#8364;", wallet_one_id: 978, sign_after_amount: false },
														  { name: "Гривна",  code: "UAH", sign: "&#8372;", wallet_one_id: 980, sign_after_amount: false }]


partners = Partner.create [{ title: "Forbes", link: "http://www.forbes.com", foto: File.open(generate_foto_path('forbes.png')) },
													 { title: "USA Today", link: "http://www.usatoday.com", foto: File.open(generate_foto_path('usa_today.png')) },
													 { title: "Fast Company", link: "https://www.fastcompany.com", foto: File.open(generate_foto_path('fast_company.png')) },
													 { title: "The New York Times", link: "http://www.nytimes.com", foto: File.open(generate_foto_path('ny_times.jpg')) },
													 { title: "CNN", link: "http://www.cnn.com", foto: File.open(generate_foto_path('cnn.jpg')) },
													 { title: "Mashable", link: "http://mashable.com", foto: File.open(generate_foto_path('mashable.png')) },
													 { title: "Bloomberg Businessweek", link: "http://www.bloomberg.com/businessweek", foto: File.open(generate_foto_path('bloomberg.jpg')) },
													 { title: "NPR", link: "http://www.npr.org", foto: File.open(generate_foto_path('npr.png')) }
													]

menu_items = MenuItem.create [{ title: "Как это работает?" },
															{ title: "Блог" },
															{ title: "Вопросы" },
															{ title: "Помощь" }]

categories = Category.create [{ title: "Медицина", full_title: "Medical, Illness & Healing", slug: "medical",
																description: "Raise money for medical bills: Fundraising for medical bills and related medical expenses.",
																popular: true,
																foto: File.open(generate_foto_path('categories/cardiogram.png')),
																cover: File.open(generate_foto_path('categories_cover/medical.png'))
															},
															{ title: "Волонтерство", full_title: "Volunteer & Service", slug: "volunteer",
																description: "Raise money to volunteer abroad, go on a service trip, or help people in your community!",
																popular: true,
																foto: File.open(generate_foto_path('categories/volunteer.png')),
																cover: File.open(generate_foto_path('categories_cover/volunteer.png'))
															},
															{ title: "Чрезвычайные ситуации", full_title: "Accidents & Emergencies", slug: "emergencies",
																description: "Raise money quickly for emergencies: fires, theft, natural disasters, living expenses and more.",
																popular: true,
																foto: File.open(generate_foto_path('categories/alarm.png')),
																cover: File.open(generate_foto_path('categories_cover/accident.png'))
															},
															{ title: "События", full_title: "Celebrations & Events", slug: "events",
																description: "Raise money for birthday parties, baby showers and more. Surprise someone with a celebration!",
																popular: true,
																foto: File.open(generate_foto_path('categories/gift.png')),
																cover: File.open(generate_foto_path('categories_cover/events.png'))
															},
															{ title: "Образование", full_title: "Education & Learning", slug: "education",
																description: "Raise money for school costs: tuition, textbooks, study abroad trips, and more.",
																popular: true,
																foto: File.open(generate_foto_path('categories/mortarboard.png')),
																cover: File.open(generate_foto_path('categories_cover/education.png'))
															},
															{ title: "Мемориалы", full_title: "Funerals & Memorials", slug: "memorials",
																description: "Raise money for funeral costs & final expenses with a memorial donation website.",
																popular: true,
																foto: File.open(generate_foto_path('categories/gate.png')),
																cover: File.open(generate_foto_path('categories_cover/funeral.png'))
															},
															{ title: "Бизнес", full_title: "Business & Entrepreneurs", slug: "business",
																description: "Raise money easily to start your own business, or to improve your existing establishment.",
																popular: false,
																foto: File.open(generate_foto_path('categories/deal.png')),
																cover: File.open(generate_foto_path('categories_cover/business.png'))
															},
															{ title: "Фонды", full_title: "Non-Profits & Charities", slug: "charity",
																description: "Select your favorite non-profit from our list of Certified Charities and start fundraising today.",
																popular: false,
																foto: File.open(generate_foto_path('categories/heart.png')),
																cover: File.open(generate_foto_path('categories_cover/nonprofit.png'))
															},
															{ title: "Сообщество", full_title: "Community & Neighbors", slug: "community",
																description: "Raise money to help improve your community: Eagle Scout projects, fundraising for neighbors, and more!",
																popular: false,
																foto: File.open(generate_foto_path('categories/connection.png')),
																cover: File.open(generate_foto_path('categories_cover/community.png'))
															},
															{ title: "Соревнования", full_title: "Competitions & Pageants", slug: "competition",
																description: "Raise money for beauty pageants and fitness competitions: Miss USA, National American Miss, and more!",
																popular: false,
																foto: File.open(generate_foto_path('categories/medal.png')),
																cover: File.open(generate_foto_path('categories_cover/sport.png')),
															},
															{ title: "Творчество", full_title: "Creative Arts, Music & Film", slug: "creative",
																description: "Raise money to help fund your creative projects: musicians, artists, dancers, and more.",
																popular: false,
																foto: File.open(generate_foto_path('categories/brainstorm.png')),
																cover: File.open(generate_foto_path('categories_cover/films.png'))
															},
															{ title: "Семейные", full_title: "Babies, Kids & Family", slug: "family",
																description: "Raise money for adoption costs, IVF, fertility treatments, and other family expenses.",
																popular: false,
																foto: File.open(generate_foto_path('categories/motherhood.png')),
																cover: File.open(generate_foto_path('categories_cover/family.png'))
															},
															{ title: "Молодожены", full_title: "Weddings & Honeymoons", slug: "newlyweds",
																description: "Raise money for honeymoons, bridal registries, wedding ceremonies, and more!",
																popular: false,
																foto: File.open(generate_foto_path('categories/wedding-couple.png')),
																cover: File.open(generate_foto_path('categories_cover/wedding.png'))
															},

															{ title: "Путешествия", full_title: "Travel & Adventure", slug: "travel",
																description: "Raise money for honeymoons, bridal registries, wedding ceremonies, and more!",
																popular: false,
																foto: File.open(generate_foto_path('categories/travel.png')),
																cover: File.open(generate_foto_path('categories_cover/travel.png'))
															},
															{ title: "Пожелания", full_title: "Dreams, Hopes & Wishes", slug: "wishes",
																description: " aise money to change someone’s life or fulfill their greatest wish!",
																popular: false,
																foto: File.open(generate_foto_path('categories/star.png')),
																cover: File.open(generate_foto_path('categories_cover/dreams.png'))
															},
															{ title: "Другие", full_title: "Other", slug: "other",
																description: "Start your own crowdfunding website for just about any idea you can think of!",
																popular: false,
																foto: File.open(generate_foto_path('categories/paper-plane.png')),
																cover: File.open(generate_foto_path('categories_cover/other.png'))
															}]
