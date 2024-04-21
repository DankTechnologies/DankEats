const scrollBehavior = { behavior: 'instant', block: 'center' };

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('a.super-notes').forEach((link) => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            const noteNumber = parseInt(link.innerText, 10);
            const notesList = document.querySelector('#notes + ol');

            // usually the <sup> link is child of a <li> that's worth highlighting when navigating back
            const originLi = link.closest('li');

            if (!notesList)
                return;

            const listItem = notesList.querySelectorAll(':scope > li')[noteNumber - 1];

            if (!listItem)
                return;

            // Remove button and list item shine, to get a clean slate
            notesList.querySelectorAll('.back-to-text').forEach(button => button.remove());
            notesList.querySelectorAll('.highlight-note').forEach(note => note.classList.remove('stretched-text', 'highlight-note'));

            // Create button that takes the user back to the <sup> they clicked
            const backButton = document.createElement('button');
            backButton.innerText = '↑';
            backButton.classList.add('back-to-text');
            backButton.addEventListener('click', function () {
                link.scrollIntoView(scrollBehavior);

                if (originLi) {
                    originLi.classList.remove('highlight-origin');
                    void originLi.offsetWidth;
                    originLi.classList.add('highlight-origin');
                }
            });

            // get list item ready to shine, then scroll to it
            listItem.classList.add('stretched-text', 'highlight-note');
            listItem.prepend(backButton);
            listItem.scrollIntoView(scrollBehavior);
        });
    });
});
