'use strict';
const switcher = document.querySelector('.btn');
switcher.addEventListener('click', function() {
    if (document.body.classList.contains('dark-theme')) {
        document.body.classList.remove('dark-theme');
        document.body.classList.add('light-theme');
        this.textContent = "Light";
    } else {
        document.body.classList.remove('light-theme');
        document.body.classList.add('dark-theme');
        this.textContent = "Dark";
    }
    console.log('current class name: ' + document.body.className);
});
