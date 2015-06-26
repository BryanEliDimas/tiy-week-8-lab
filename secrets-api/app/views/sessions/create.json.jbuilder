# on successful login,
# send back their info including their key

json.(@user, :name, :id, :email, :key)
