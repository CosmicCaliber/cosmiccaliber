// ......DISPLAY MOBILE MENU...... //

let button = document.getElementById("mobile-menu-button");
let menu = document.getElementById("mobile-menu");
console.log(menu);
button.onclick = function toggleMobileMenu() {

    if (menu.classList.contains("open")) {
        menu.style.display = null;
        button.innerHTML = `<h3>Menu</h3>`;
        button.style.backgroundColor = "#341A09";
        button.style.color = "#f5debd";
        button.style.textShadow = "0 0 3px #F35E36";
        menu.classList.remove("open");
    } else {
        menu.style.display = "grid";
        button.innerHTML = `<h3>Hide Menu</h3>`;
        button.style.backgroundColor = "#140a05";
        button.style.color = "#c58b7a";
        button.style.textShadow = "none";
        menu.classList.add("open");
    }
};

// ......COPY URL TO CLIPBOARD WHEN SHARE BUTTON IS CLICKED...... //

let share_button = document.getElementById("share-button");

share_button.onclick = function copyURL() {
    let URL = window.location.href;
    let dummy = document.createElement('input');
    let modal = document.getElementById("copy-modal");

    document.body.appendChild(dummy);
    dummy.value = URL;
    dummy.select();
    document.execCommand('Copy');
    document.body.removeChild(dummy);

    modal.className = "show";
    console.log(modal);

    setTimeout(function(){modal.className = modal.className.replace("show","");}, 3000);
}

// ...... TRANSCRIPT SELECTION ...... //
let languageList = document.getElementById("language-select");
let transcriptList = document.getElementById("active-transcript");
let transcripts = transcriptList.children;

// if (languageList.selectedIndex === -1){
    languageList.selectedIndex = 0;
// }
transcripts[languageList.selectedIndex].style.display = "block";

languageList.addEventListener("click",function() {

    for (let i = 0; i < transcripts.length; i++) {
        if (i === languageList.selectedIndex) {
            transcripts[i].style.display = "block";
        } else {
            transcripts[i].style.display = "none";
        }
    }
})
