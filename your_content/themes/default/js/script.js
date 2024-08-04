document.addEventListener('DOMContentLoaded', function() {
    var hamburgerMenu = document.getElementById('hamburger-menu');
    var linksBar = document.getElementById('links-bar');

    hamburgerMenu.addEventListener('click', function() {
        if (linksBar.style.display === 'block') {
            linksBar.style.display = 'none';
        } else {
            linksBar.style.display = 'block';
        }
    });
});

