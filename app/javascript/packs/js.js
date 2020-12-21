let buttonClick = document.querySelector(
  "body > main > section > div > div > i"
);
let userLogin = document.querySelector("body > nav > div > a");
function onClickUserLogin() {
  userLogin.classList.toggle("d-none");
}
buttonClick.addEventListener("click", onClickUserLogin);
