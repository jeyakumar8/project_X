Store.destroy_all
Driver.destroy_all
Product.destroy_all
StoresDriver.destroy_all
StoresProduct.destroy_all
NO_OF_DRIVERS = 3
NO_OF_STORES = 3
NO_OF_PRODUCT = 3
kk = [[13.0040793,80.249329], [12.987105, 80.243977], [12.9624185,80.2537272]]
(1..NO_OF_STORES).each do |i|
	data = Store.new
	data.store_name = "Store" + i.to_s
	data.latitude = kk[i-1][0]
	data.longitude = kk[i-1][1]
	data.save
end

(1..NO_OF_DRIVERS).each do |i|
	data = Driver.new
	data.name = "Driver" + i.to_s
	data.available = true
	data.save
end

(1..NO_OF_PRODUCT).each do |i|
	data = Product.new
	data.name = "Product" + i.to_s
	data.save
end

StoresDriver.create(store_id: Store.first.id + 0 , driver_id:  Driver.first.id + 0, eta: rand(999).to_s)
StoresDriver.create(store_id: Store.first.id + 0 , driver_id:  Driver.first.id + 1, eta: rand(999).to_s)
StoresDriver.create(store_id: Store.first.id + 0 , driver_id:  Driver.first.id + 2, eta: rand(999).to_s)
StoresDriver.create(store_id: Store.first.id + 1 , driver_id:  Driver.first.id + 0, eta: rand(999).to_s)
StoresDriver.create(store_id: Store.first.id + 1 , driver_id:  Driver.first.id + 1, eta: rand(999).to_s)
StoresDriver.create(store_id: Store.first.id + 2 , driver_id:  Driver.first.id + 0, eta: rand(999).to_s)


StoresProduct.create(store_id: Store.first.id + 0 , product_id:  Product.first.id + 0, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)
StoresProduct.create(store_id: Store.first.id + 0 , product_id:  Product.first.id + 1, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)
StoresProduct.create(store_id: Store.first.id + 0 , product_id:  Product.first.id + 2, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)
StoresProduct.create(store_id: Store.first.id + 1 , product_id:  Product.first.id + 0, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)
StoresProduct.create(store_id: Store.first.id + 1 , product_id:  Product.first.id + 1, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)
StoresProduct.create(store_id: Store.first.id + 2 , product_id:  Product.first.id + 0, product_rating: rand(1..4).to_s + '.' + rand(9).to_s)










#others
#StoresDriver.joins(:driver).where("available = ? AND store_id = ?", true, 1).first.eta