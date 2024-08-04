document.addEventListener('DOMContentLoaded', function() {
    var acc = document.getElementsByClassName("accordion-button");
    var i;

    // Toggle accordion content
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }

    // Function to handle display based on screen size
    function handleResize() {
        var desktopNav = document.getElementById('links-bar');
        var accordion = document.querySelector('.accordion');
        if (window.innerWidth <= 768) {
            desktopNav.style.display = 'none';
            accordion.style.display = 'flex';
        } else {
            desktopNav.style.display = 'block';
            accordion.style.display = 'none';
        }
    }

    // Initial check
    handleResize();

    // Add event listener for window resize
    window.addEventListener('resize', handleResize);
});

