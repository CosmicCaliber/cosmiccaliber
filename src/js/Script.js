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

    // Function to handle display based on screen size
    function handleResize() {
        if (window.innerWidth > 768) {
            linksBar.style.display = 'block';
        } else {
            linksBar.style.display = 'none';
        }
    }

    // Initial check
    handleResize();

    // Add event listener for window resize
    window.addEventListener('resize', handleResize);
});

