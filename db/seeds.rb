def generate_foto_path(title)
	Rails.root.join('public', 'temp', title).to_s
end

# AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

currencies = Currency.create [{ name: "Рубли",   code: "RUB", sign: "Р" },
														  { name: "Доллары", code: "USD", sign: "$" },
														  { name: "Евро",    code: "EUR", sign: "&#8364;" },
														  { name: "Гривна",  code: "UAH", sign: "&#8372;" }]


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
