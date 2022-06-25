export default {
	headers: {
		'Content-Type': 'application/json' ,
		'Authorization' : 'Bearer '+ localStorage.getItem("token"),
	},
	google: {
		client_id: "879549587031-ohodmoqbqe3lu01jng08j6v3dj09rb09.apps.googleusercontent.com"
	},
	isProduction: true
}
