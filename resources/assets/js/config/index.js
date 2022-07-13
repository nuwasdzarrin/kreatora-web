export default {
	headers: {
		'Content-Type': 'application/json' ,
		'Authorization' : 'Bearer '+ localStorage.getItem("token"),
	},
	google: {
		client_id: "362844505116-f9pil6mf5abiuoqahv815h3ul1gvj9ru.apps.googleusercontent.com"
		// client_id: "879549587031-ohodmoqbqe3lu01jng08j6v3dj09rb09.apps.googleusercontent.com"
	},
	isProduction: false
}
