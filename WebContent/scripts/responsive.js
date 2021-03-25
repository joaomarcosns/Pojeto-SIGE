const navSlide = () => {
    const burguer = document.querySelector('.burger');
    const navBar = document.querySelector('.nav-links');

    burguer.addEventListener('click', () => {
        navBar.classList.toggle('navbar-active');
    });
}

navSlide();